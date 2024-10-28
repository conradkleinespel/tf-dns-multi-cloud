locals {
  dns_zone_domain_with_dots_escaped = replace(var.dns_zone_domain, "/\\./", "\\.")
  subdomain                         = replace(var.domain, "/(^|\\.)${local.dns_zone_domain_with_dots_escaped}$/", "")
}

resource "cloudflare_record" "txt" {
  count = var.cloudflare_enabled ? 1 : 0

  name    = var.domain
  proxied = false
  ttl     = 60
  type    = "TXT"
  value   = var.value
  zone_id = var.cloudflare_zone_id
}

resource "scaleway_domain_record" "txt" {
  count = var.scaleway_enabled ? 1 : 0

  dns_zone = var.dns_zone_domain
  name     = local.subdomain
  type     = "TXT"
  data     = var.value
  ttl      = 60
}

resource "ovh_domain_zone_record" "txt" {
  count = var.ovh_enabled ? 1 : 0

  zone      = var.dns_zone_domain
  subdomain = local.subdomain
  fieldtype = "TXT"
  ttl       = 60
  target    = var.value
}
