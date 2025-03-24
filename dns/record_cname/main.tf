module "cloudflare_record" {
  source = "./provider_cloudflare"
  count  = var.cloudflare_enabled ? 1 : 0

  cloudflare_zone_id = var.cloudflare_zone_id
  domain             = var.domain
  value              = var.value
}

module "scaleway_domain_record" {
  source = "./provider_scaleway"
  count = var.scaleway_enabled ? 1 : 0

  domain             = var.domain
  value              = var.value
  dns_zone_domain    = var.dns_zone_domain
}

module "ovh_domain_zone_record" {
  source = "./provider_ovh"
  count = var.ovh_enabled ? 1 : 0

  domain             = var.domain
  value              = var.value
  dns_zone_domain    = var.dns_zone_domain
}
