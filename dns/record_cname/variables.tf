variable "domain" {
  type = string
}

variable "value" {
  type = string
}

variable "dns_zone_domain" {
  type = string
}

variable "cloudflare_zone_id" {
  type = string
}

variable "cloudflare_enabled" {
  type    = bool
  default = false
}

variable "scaleway_enabled" {
  type    = bool
  default = false
}

variable "ovh_enabled" {
  type    = bool
  default = false
}
