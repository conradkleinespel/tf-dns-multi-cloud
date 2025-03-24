resource "scaleway_domain_record" "srv" {
  dns_zone = var.dns_zone_domain
  name     = "${var.service}.${var.proto}"
  type     = "SRV"
  data     = "${var.priority} ${var.weight} ${var.port} ${var.target}."
  ttl      = 60
}
