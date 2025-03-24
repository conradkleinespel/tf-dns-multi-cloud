resource "ovh_domain_zone_record" "srv" {
  zone      = var.dns_zone_domain
  subdomain = "${var.service}.${var.proto}"
  fieldtype = "SRV"
  ttl       = 60
  target    = "${var.priority} ${var.weight} ${var.port} ${var.target}."
}
