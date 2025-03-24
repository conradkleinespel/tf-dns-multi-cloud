resource "cloudflare_dns_record" "txt" {
  name    = var.domain
  proxied = false
  ttl     = 60
  type    = "TXT"
  content = "\"${var.value}\""

  zone_id = var.cloudflare_zone_id
}
