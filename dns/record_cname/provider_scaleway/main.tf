locals {
  dns_zone_domain_with_dots_escaped = replace(var.dns_zone_domain, "/\\./", "\\.")
  subdomain                         = replace(var.domain, "/(^|\\.)${local.dns_zone_domain_with_dots_escaped}$/", "")
}

resource "scaleway_domain_record" "cname" {
  dns_zone = var.dns_zone_domain
  name     = local.subdomain
  type     = "CNAME"
  data     = "${var.value}."
  ttl      = 60
}
