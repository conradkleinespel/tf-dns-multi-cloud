variable "domain" {
  type = string
}

variable "ip_addresses" {
  type = list(string)
}

variable "cloudflare_zone_id" {
  type    = string
  default = ""
}
