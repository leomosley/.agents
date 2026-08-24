#!/usr/bin/env bash
set -euo pipefail

API="https://api.porkbun.com/api/json/v3"

# Load credentials from env, falling back to a ~/.porkbun key=value file.
load_creds() {
  if [ -z "${PORKBUN_API_KEY:-}" ] || [ -z "${PORKBUN_SECRET_API_KEY:-}" ]; then
    local file="${PORKBUN_CREDS_FILE:-$HOME/.porkbun}"
    if [ -f "$file" ]; then
      set -a
      # shellcheck disable=SC1090
      . "$file"
      set +a
    fi
  fi
  : "${PORKBUN_API_KEY:?set PORKBUN_API_KEY or add it to ~/.porkbun}"
  : "${PORKBUN_SECRET_API_KEY:?set PORKBUN_SECRET_API_KEY or add it to ~/.porkbun}"
}

# Merge the auth keys into a JSON body and POST it.
call() {
  local path="$1"
  local body="${2:-{}}"
  local auth
  auth=$(printf '{"apikey":"%s","secretapikey":"%s"}' "$PORKBUN_API_KEY" "$PORKBUN_SECRET_API_KEY")
  local merged
  merged=$(jq -c -s '.[0] * .[1]' <(printf '%s' "$auth") <(printf '%s' "$body"))
  curl -sS -X POST "$API/$path" -H 'Content-Type: application/json' -d "$merged"
}

usage() {
  cat <<'EOF'
porkbun.sh - thin wrapper over the Porkbun DNS API

Usage:
  porkbun.sh ping
  porkbun.sh list <domain>
  porkbun.sh add <domain> <type> <name> <content> [ttl]
  porkbun.sh edit <domain> <id> <type> <name> <content> [ttl]
  porkbun.sh delete <domain> <id>

Notes:
  name  is the subdomain only ("www"), or "" for the root.
  ttl   defaults to 600 (Porkbun minimum).
  Credentials come from PORKBUN_API_KEY + PORKBUN_SECRET_API_KEY,
  or a ~/.porkbun file containing those as key=value lines.
EOF
}

cmd="${1:-}"
[ -n "$cmd" ] || { usage; exit 1; }
shift || true

load_creds

case "$cmd" in
  ping)
    call ping
    ;;
  list)
    domain="${1:?domain required}"
    call "dns/retrieve/$domain"
    ;;
  add)
    domain="${1:?domain required}"
    type="${2:?type required}"
    name="${3?name required (use "" for root)}"
    content="${4:?content required}"
    ttl="${5:-600}"
    body=$(jq -n --arg t "$type" --arg n "$name" --arg c "$content" --arg ttl "$ttl" \
      '{type:$t,name:$n,content:$c,ttl:$ttl}')
    call "dns/create/$domain" "$body"
    ;;
  edit)
    domain="${1:?domain required}"
    id="${2:?record id required}"
    type="${3:?type required}"
    name="${4?name required (use "" for root)}"
    content="${5:?content required}"
    ttl="${6:-600}"
    body=$(jq -n --arg t "$type" --arg n "$name" --arg c "$content" --arg ttl "$ttl" \
      '{type:$t,name:$n,content:$c,ttl:$ttl}')
    call "dns/edit/$domain/$id" "$body"
    ;;
  delete)
    domain="${1:?domain required}"
    id="${2:?record id required}"
    call "dns/delete/$domain/$id"
    ;;
  *)
    usage
    exit 1
    ;;
esac
