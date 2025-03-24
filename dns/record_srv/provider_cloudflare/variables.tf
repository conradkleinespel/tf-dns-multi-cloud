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

variable "cloudflare_zone_id" {
  type    = string
  default = ""
}
