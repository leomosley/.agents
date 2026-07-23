variable "cloudflare_api_token" {
  description = "Cloudflare API token with Workers, KV, DNS, and Zone Settings permissions"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID for {{DOMAIN}}"
  type        = string
}

variable "domain" {
  description = "Public domain"
  type        = string
  default     = "{{DOMAIN}}"
}
