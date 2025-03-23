variable "service" {
  type = string
}

variable "proto" {
  type = string
}

variable "target" {
  type = string
}

variable "priority" {
  type = number
}

variable "weight" {
  type = number
}

variable "port" {
  type = number
}

variable "dns_zone_domain" {
  type = string
}

variable "cloudflare_zone_id" {
  type = string
  default = ""
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
