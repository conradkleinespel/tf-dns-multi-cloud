locals {
  dns_zone_domain_with_dots_escaped = replace(var.dns_zone_domain, ".", "\\.")
  subdomain                         = replace(var.domain, "/(^|\\.)${local.dns_zone_domain_with_dots_escaped}$/", "")
}

resource "scaleway_domain_record" "a" {
  for_each = toset(var.ip_addresses)

  dns_zone = var.dns_zone_domain
  name     = local.subdomain
  type     = "A"
  data     = each.value
  ttl      = 60
}
