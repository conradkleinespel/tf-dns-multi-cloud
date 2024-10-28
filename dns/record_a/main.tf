locals {
  dns_zone_domain_with_dots_escaped = replace(var.dns_zone_domain, ".", "\\.")
  subdomain                         = replace(var.domain, "/(^|\\.)${local.dns_zone_domain_with_dots_escaped}$/", "")
}

resource "cloudflare_record" "a" {
  for_each = toset(var.cloudflare_enabled ? var.ip_addresses : [])

  name    = var.domain
  proxied = false
  ttl     = 60
  type    = "A"
  value   = each.value
  zone_id = var.cloudflare_zone_id
}

resource "scaleway_domain_record" "a" {
  for_each = toset(var.scaleway_enabled ? var.ip_addresses : [])

  dns_zone = var.dns_zone_domain
  name     = local.subdomain
  type     = "A"
  data     = each.value
  ttl      = 60
}

resource "ovh_domain_zone_record" "a" {
  for_each = toset(var.ovh_enabled ? var.ip_addresses : [])

  zone      = var.dns_zone_domain
  subdomain = local.subdomain
  fieldtype = "A"
  ttl       = 60
  target    = each.value
}
