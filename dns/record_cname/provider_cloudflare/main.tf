resource "cloudflare_dns_record" "cname" {
  name    = var.domain
  proxied = false
  ttl     = 60
  type    = "CNAME"
  content = var.value
  zone_id = var.cloudflare_zone_id
}
