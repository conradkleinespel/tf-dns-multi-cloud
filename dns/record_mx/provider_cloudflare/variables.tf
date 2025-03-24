variable "domain" {
  type = string
}

variable "server" {
  type = string
}

variable "priority" {
  type = number
}

variable "cloudflare_zone_id" {
  type    = string
  default = ""
}
