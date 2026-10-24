data "cloudflare_zone" "georgemccarron" {
  filter = {
    name = local.domain
  }
}

locals {
  domain  = "georgemccarron.com"
  zone_id = data.cloudflare_zone.georgemccarron.zone_id

  google_workspace_cnames = toset([
    "calendar",
    "drive",
    "mail",
  ])

  gmail_mx = {
    "aspmx.l.google.com"      = 1
    "alt1.aspmx.l.google.com" = 5
    "alt2.aspmx.l.google.com" = 5
    "alt3.aspmx.l.google.com" = 10
    "alt4.aspmx.l.google.com" = 10
  }

  r53_ns = toset([
    "ns-627.awsdns-14.net",
    "ns-314.awsdns-39.com",
    "ns-1664.awsdns-16.co.uk",
    "ns-1278.awsdns-31.org",
  ])

  root_txt = {
    hibp                           = "have-i-been-pwned-verification=631ce70aff80ff053ab2c5719e8141ef"
    spf                            = "v=spf1 include:_spf.google.com ~all"
    google_site_verification       = "google-site-verification=-gtMxdeTYzmCCYuBtzD-f8n0JNKyl-s1qRmeguoWGD4"
    google_postmaster_verification = "google-site-verification=pYI7aOI7QSqkn3uGiZVe9tGZuDZORfZ_ieZ2aByVPzc"
  }
}

resource "cloudflare_dns_record" "root_a_vercel" {
  name    = local.domain
  proxied = false
  ttl     = 1
  type    = "A"
  zone_id = local.zone_id
  content = "76.76.21.21"
}

resource "cloudflare_dns_record" "letsencrypt" {
  name    = local.domain
  proxied = false
  ttl     = 1
  type    = "CAA"
  zone_id = local.zone_id
  data = {
    flags = 0
    tag   = "issue"
    value = "letsencrypt.org"
  }
}

resource "cloudflare_dns_record" "google_workspace_cname" {
  for_each = local.google_workspace_cnames

  name    = each.value
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = local.zone_id
  content = "ghs.googlehosted.com"
}

resource "cloudflare_dns_record" "www_subdomain_vercel" {
  name    = "www"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  zone_id = local.zone_id
  content = "cname.vercel-dns.com"
}

resource "cloudflare_dns_record" "gmail_mx" {
  for_each = local.gmail_mx

  name     = local.domain
  priority = each.value
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = local.zone_id
  content  = each.key
}

resource "cloudflare_dns_record" "r53_ns" {
  for_each = local.r53_ns

  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  zone_id = local.zone_id
  content = each.value
}

resource "cloudflare_dns_record" "gmail_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = local.zone_id
  content = "v=DMARC1; p=none"
}

resource "cloudflare_dns_record" "root_txt" {
  for_each = local.root_txt

  name    = local.domain
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = local.zone_id
  content = each.value
}

resource "cloudflare_dns_record" "gmail_dkim" {
  name    = "google._domainkey"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = local.zone_id
  content = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA28eLjC3k7Y0ESfofSUyFjdy0SE7gNKSsKhABPcrn8gaXtXXs/+4YNyx2rOWZbylwcKBAS5yto5OvlQN1zPmpgk3xaAvzlJ2OIQJDdl7Ltz9vZCRyZF2bBZT3QWrdTs+BFUpzExFfdbM04Ew0SL3P+2ymg64LJMPBG6Z4mlVNkzQhqpUx7ylcKj99JOkUi3aicBt5r/cpbyrkbVKH+iPRB+Zn9i5L3kiluIhdMEeK1R2U9hQsS9EBTpU5llwTlwQVzx3eeLyLgZ1fgLMeNGT1P5Mu8Moq7MxSjj+rlv8fk9D0+o1PHcalmgf8B4XZnBeAnvvSoaj9c6F0zpTm3QvD8QIDAQAB"
}

resource "cloudflare_dns_record" "networth_resend_dkim" {
  name    = "resend._domainkey.networth"
  type    = "TXT"
  ttl     = 1
  proxied = false
  zone_id = local.zone_id
  content = "p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC7pFKpeH8wESO68dKPpHEnSHxDO5crs5oeeyRQwLzcxsDpwGRxMflYQ7djs80ipbmMTmhDTYmLVaVTXfZC/phmj2n3/6dqQugsz5mR8AAJrfmA0G23Om6/o/QVcQCvAIcr8rgbppN25tXsaDJarikqkLAeczB5hpE5lXQiZcfyvQIDAQAB"
}

resource "cloudflare_dns_record" "networth_resend_mx" {
  name     = "send.networth"
  type     = "MX"
  priority = 10
  ttl      = 1
  proxied  = false
  zone_id  = local.zone_id
  content  = "feedback-smtp.eu-west-1.amazonses.com"
}

resource "cloudflare_dns_record" "networth_resend_spf" {
  name    = "send.networth"
  type    = "TXT"
  ttl     = 1
  proxied = false
  zone_id = local.zone_id
  content = "v=spf1 include:amazonses.com ~all"
}

resource "cloudflare_dns_record" "networth_vercel_cname" {
  name    = "networth"
  type    = "CNAME"
  ttl     = 1
  proxied = false
  zone_id = local.zone_id
  content = "997f4b19f9cdac58.vercel-dns-017.com"
}
