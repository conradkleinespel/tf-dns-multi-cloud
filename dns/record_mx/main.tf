locals {
  dns_zone_domain_with_dots_escaped = replace(var.dns_zone_domain, "/\\./", "\\.")
  subdomain                         = replace(var.domain, "/(^|\\.)${local.dns_zone_domain_with_dots_escaped}$/", "")
}

resource "cloudflare_record" "mx" {
  count = var.cloudflare_enabled ? 1 : 0

  name     = var.domain
  priority = var.priority
  proxied  = false
  ttl      = 60
  type     = "MX"
  value    = var.server
  zone_id  = var.cloudflare_zone_id
}

resource "scaleway_domain_record" "mx" {
  count = var.scaleway_enabled ? 1 : 0

  dns_zone = var.dns_zone_domain
  name     = local.subdomain
  type     = "MX"
  data     = "${var.server}."
  ttl      = 60
  priority = var.priority
}

resource "ovh_domain_zone_record" "mx" {
  count = var.ovh_enabled ? 1 : 0

  zone      = var.dns_zone_domain
  subdomain = local.subdomain
  fieldtype = "MX"
  ttl       = 60
  target    = "${var.priority} ${var.server}."
}
