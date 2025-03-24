locals {
  dns_zone_domain_with_dots_escaped = replace(var.dns_zone_domain, "/\\./", "\\.")
  subdomain                         = replace(var.domain, "/(^|\\.)${local.dns_zone_domain_with_dots_escaped}$/", "")
}

resource "scaleway_domain_record" "mx" {
  dns_zone = var.dns_zone_domain
  name     = local.subdomain
  type     = "MX"
  data     = "${var.server}."
  ttl      = 60
  priority = var.priority
}
