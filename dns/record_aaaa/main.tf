resource "null_resource" "validate_domain" {
  count = substr(var.domain, length(var.domain) - length(var.dns_zone_domain), length(var.dns_zone_domain)) == var.dns_zone_domain ? 0 : 1

  provisioner "local-exec" {
    command = "echo 'Error: The domain must end with the dns_zone_domain.' && exit 1"
  }
}

module "cloudflare_record" {
  source = "./provider_cloudflare"
  count = var.cloudflare_enabled ? 1 : 0

  cloudflare_zone_id = var.cloudflare_zone_id
  domain = var.domain
  ip_addresses = var.ip_addresses
}

module "scaleway_domain_record" {
  source = "./provider_scaleway"
  count = var.scaleway_enabled ? 1 : 0

  dns_zone_domain = var.dns_zone_domain
  domain = var.domain
  ip_addresses = var.ip_addresses
}

module "ovh_domain_zone_record" {
  source = "./provider_ovh"
  count = var.ovh_enabled ? 1 : 0

  dns_zone_domain = var.dns_zone_domain
  domain = var.domain
  ip_addresses = var.ip_addresses
}
