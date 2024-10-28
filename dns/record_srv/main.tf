resource "cloudflare_record" "srv" {
  count = var.cloudflare_enabled ? 1 : 0

  priority = var.priority
  proxied  = false
  ttl      = 60
  type     = "SRV"
  zone_id  = var.cloudflare_zone_id
  name     = "${var.service}.${var.proto}"

  data {
    priority = var.priority
    weight   = var.weight
    port     = var.port
    target   = length(var.target) > 0 ? var.target : "."
  }
}

resource "scaleway_domain_record" "srv" {
  count = var.scaleway_enabled ? 1 : 0

  dns_zone = var.dns_zone_domain
  name     = "${var.service}.${var.proto}"
  type     = "SRV"
  data     = "${var.priority} ${var.weight} ${var.port} ${var.target}."
  ttl      = 60
}


resource "ovh_domain_zone_record" "srv" {
  count = var.ovh_enabled ? 1 : 0

  zone      = var.dns_zone_domain
  subdomain = "${var.service}.${var.proto}"
  fieldtype = "SRV"
  ttl       = 60
  target    = "${var.priority} ${var.weight} ${var.port} ${var.target}."
}
