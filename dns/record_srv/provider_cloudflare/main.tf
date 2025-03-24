resource "cloudflare_dns_record" "srv" {
  priority = var.priority
  proxied  = false
  ttl      = 60
  type     = "SRV"
  zone_id  = var.cloudflare_zone_id
  name     = "${var.service}.${var.proto}"

  data = {
    priority = var.priority
    weight   = var.weight
    port     = var.port
    target   = length(var.target) > 0 ? var.target : "."
  }
}
