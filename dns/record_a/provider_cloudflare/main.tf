resource "cloudflare_dns_record" "a" {
  for_each = toset(var.ip_addresses)

  name    = var.domain
  proxied = false
  ttl     = 60
  type    = "A"
  content = each.value
  zone_id = var.cloudflare_zone_id
}
