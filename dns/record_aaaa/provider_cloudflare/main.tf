resource "cloudflare_dns_record" "aaaa" {
  for_each = toset(var.ip_addresses)

  name    = var.domain
  proxied = false
  ttl     = 60
  type    = "AAAA"
  content = each.value
  zone_id = var.cloudflare_zone_id
}
