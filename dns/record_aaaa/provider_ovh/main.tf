locals {
  dns_zone_domain_with_dots_escaped = replace(var.dns_zone_domain, ".", "\\.")
  subdomain                         = replace(var.domain, "/(^|\\.)${local.dns_zone_domain_with_dots_escaped}$/", "")
}

resource "ovh_domain_zone_record" "aaaa" {
  for_each = toset(var.ip_addresses)

  zone      = var.dns_zone_domain
  subdomain = local.subdomain
  fieldtype = "AAAA"
  ttl       = 60
  target    = each.value
}
