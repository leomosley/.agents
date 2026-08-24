---
name: porkbun
description: >
  Manage Porkbun DNS records (add, list, edit, delete) from the command line via
  the Porkbun API. Use when the user wants to configure DNS on a Porkbun domain,
  for example adding a CNAME, A, TXT, or MX record.
---

# Porkbun DNS

Porkbun has no official CLI, but it exposes a REST API. This skill wraps the DNS
endpoints in `porkbun.sh`.

## Credentials

Two keys are needed, created at porkbun.com under Account -> API Access:

- `PORKBUN_API_KEY` (starts with `pk1_`)
- `PORKBUN_SECRET_API_KEY` (starts with `sk1_`)

The script reads them from the environment, or from a `~/.porkbun` file holding
key=value lines:

```sh
PORKBUN_API_KEY=pk1_xxx
PORKBUN_SECRET_API_KEY=sk1_xxx
```

Keep `~/.porkbun` private (`chmod 600 ~/.porkbun`). Never print the secret key or
paste it into chat.

Per-domain gotcha: API Access must also be toggled ON for the specific domain
under Domain Management -> Details. A missing toggle is the usual cause of a 403.

## Requirements

`curl` and `jq` must be installed.

## Usage

```sh
skills/porkbun/porkbun.sh ping                                   # verify auth
skills/porkbun/porkbun.sh list   example.com                     # list records
skills/porkbun/porkbun.sh add    example.com CNAME www target.example.com 600
skills/porkbun/porkbun.sh edit   example.com <id> CNAME www new-target.example.com
skills/porkbun/porkbun.sh delete example.com <id>
```

Argument notes:

- `name` is the subdomain only (`www`), or `""` for the root.
- `content` is the record target.
- `ttl` defaults to 600, the Porkbun minimum.
- Record `id` values come from the `list` command.

## Adding a CNAME

1. Run `ping` to confirm the keys work.
2. Run `list <domain>` to check the record does not already exist.
3. Run `add <domain> CNAME <name> <target>`.
4. Run `list <domain>` again to confirm the new record and note its id.

A CNAME cannot coexist with other records on the same name, and the root of a
domain usually cannot be a CNAME. Warn the user if either applies.
