resource "cloudflare_dns_record" "mx" {
  name     = var.domain
  priority = var.priority
  proxied  = false
  ttl      = 60
  type     = "MX"
  content  = var.server
  zone_id  = var.cloudflare_zone_id
}
