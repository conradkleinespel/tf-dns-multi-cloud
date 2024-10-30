# DNS records across providers

This repo contains Terraform (or Tofu) modules to create DNS records the same way for a variety of hosted DNS providers.

The modules support the following providers:
- Cloudflare;
- Scaleway;
- OVH.

And the following record types:
- A;
- CNAME;
- MX;
- SRV;
- TXT.

## Examples

### A record

```hcl
module "example-com-a" {
  source = "https://github.com/conradkleinespel/tf-dns-multi-cloud//dns/record_a"

  ip_addresses       = ["12.13.14.15", "13.14.15.16"]
  domain             = "www.example.com"
  dns_zone_domain    = "example.com"

  cloudflare_zone_id = cloudflare_zone.conradk_com.id

  cloudflare_enabled = true
  scaleway_enabled   = true
  ovh_enabled        = true
}
```

### TXT record

```hcl
module "example-com-txt" {
  source = "https://github.com/conradkleinespel/tf-dns-multi-cloud//dns/record_txt"

  domain             = "my-txt-domain.example.com"
  value              = "value without quotes"
  dns_zone_domain    = "example.com"

  cloudflare_zone_id = var.cloudflare_zone_id

  cloudflare_enabled = true
  scaleway_enabled   = true
  ovh_enabled        = true
}
```

### MX record

```hcl
module "example-com-mx" {
  source = "https://github.com/conradkleinespel/tf-dns-multi-cloud//dns/record_mx"

  domain             = "example.com"
  priority           = 10
  server             = "my-mx-server"
  dns_zone_domain    = "example.com"

  cloudflare_zone_id = var.cloudflare_zone_id

  cloudflare_enabled = true
  scaleway_enabled   = true
  ovh_enabled        = true
}
```

### SRV record

```hcl
module "example-com-srv" {
  source = "https://github.com/conradkleinespel/tf-dns-multi-cloud//dns/record_srv"

  service            = "_caldavs"
  proto              = "_tcp"
  priority           = 0
  weight             = 1
  port               = 443
  target             = "my-caldav-server"
  dns_zone_domain    = "example.com"

  cloudflare_zone_id = var.cloudflare_zone_id

  cloudflare_enabled = true
  scaleway_enabled   = true
  ovh_enabled        = true
}
```

### CNAME record

```hcl
module "example-com-cname" {
  source = "https://github.com/conradkleinespel/tf-dns-multi-cloud//dns/record_cname"

  domain             = "subdomain.example.com"
  value              = "my-cname-server"
  dns_zone_domain    = "example.com"

  cloudflare_zone_id = var.cloudflare_zone_id

  cloudflare_enabled = true
  scaleway_enabled   = true
  ovh_enabled        = true
}
```
