locals {
  dns_zone_domain_with_dots_escaped = replace(var.dns_zone_domain, ".", "\\.")
  subdomain                         = replace(var.domain, "/(^|\\.)${local.dns_zone_domain_with_dots_escaped}$/", "")
}

resource "null_resource" "validate_domain" {
  count = substr(var.domain, length(var.domain) - length(var.dns_zone_domain), length(var.dns_zone_domain)) == var.dns_zone_domain ? 0 : 1

  provisioner "local-exec" {
    command = "echo 'Error: The domain must end with the dns_zone_domain.' && exit 1"
  }
}

resource "cloudflare_record" "aaaa" {
  for_each = toset(var.cloudflare_enabled ? var.ip_addresses : [])

  name    = var.domain
  proxied = false
  ttl     = 60
  type    = "AAAA"
  value   = each.value
  zone_id = var.cloudflare_zone_id
}

resource "scaleway_domain_record" "aaaa" {
  for_each = toset(var.scaleway_enabled ? var.ip_addresses : [])

  dns_zone = var.dns_zone_domain
  name     = local.subdomain
  type     = "AAAA"
  data     = each.value
  ttl      = 60
}

resource "ovh_domain_zone_record" "aaaa" {
  for_each = toset(var.ovh_enabled ? var.ip_addresses : [])

  zone      = var.dns_zone_domain
  subdomain = local.subdomain
  fieldtype = "AAAA"
  ttl       = 60
  target    = each.value
}
