locals {
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_dns_record" "root_a_vercel" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "A"
  zone_id = local.zone_id
  content = "76.76.21.21"
}

resource "cloudflare_dns_record" "letsencrypt" {
  name    = "georgemccarron.com"
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

resource "cloudflare_dns_record" "calendar_subdomain" {
  name    = "calendar"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = local.zone_id
  content = "ghs.googlehosted.com"
}

resource "cloudflare_dns_record" "drive_subdomain" {
  name    = "drive"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = local.zone_id
  content = "ghs.googlehosted.com"
}

resource "cloudflare_dns_record" "mail_subdomain" {
  name    = "mail"
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

resource "cloudflare_dns_record" "mail_primary" {
  name     = "georgemccarron.com"
  priority = 1
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = local.zone_id
  content  = "aspmx.l.google.com"
}

resource "cloudflare_dns_record" "mail_alt_1" {
  name     = "georgemccarron.com"
  priority = 5
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = local.zone_id
  content  = "alt1.aspmx.l.google.com"
}

resource "cloudflare_dns_record" "mail_alt_2" {
  name     = "georgemccarron.com"
  priority = 5
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = local.zone_id
  content  = "alt2.aspmx.l.google.com"
}

resource "cloudflare_dns_record" "mail_alt_3" {
  name     = "georgemccarron.com"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = local.zone_id
  content  = "alt3.aspmx.l.google.com"
}

resource "cloudflare_dns_record" "mail_alt_4" {
  name     = "georgemccarron.com"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = local.zone_id
  content  = "alt4.aspmx.l.google.com"
}

resource "cloudflare_dns_record" "r53_ns_1" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  zone_id = local.zone_id
  content = "ns-627.awsdns-14.net"
}

resource "cloudflare_dns_record" "r53_ns_2" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  zone_id = local.zone_id
  content = "ns-314.awsdns-39.com"
}

resource "cloudflare_dns_record" "r53_ns_3" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  zone_id = local.zone_id
  content = "ns-1664.awsdns-16.co.uk"
}

resource "cloudflare_dns_record" "r53_ns_4" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  zone_id = local.zone_id
  content = "ns-1278.awsdns-31.org"
}

resource "cloudflare_dns_record" "gmail_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = local.zone_id
  content = "v=DMARC1; p=none"
}

resource "cloudflare_dns_record" "hibp_verification" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = local.zone_id
  content = "have-i-been-pwned-verification=631ce70aff80ff053ab2c5719e8141ef"
}

resource "cloudflare_dns_record" "gmail_spf" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = local.zone_id
  content = "v=spf1 include:_spf.google.com ~all"
}

resource "cloudflare_dns_record" "google_site_verification" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = local.zone_id
  content = "google-site-verification=-gtMxdeTYzmCCYuBtzD-f8n0JNKyl-s1qRmeguoWGD4"
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

resource "cloudflare_dns_record" "househunt_vercel_cname" {
  name    = "househunt"
  type    = "CNAME"
  ttl     = 1
  proxied = false
  zone_id = local.zone_id
  content = "60913cc48011efbe.vercel-dns-017.com"
}

resource "cloudflare_dns_record" "househunt_resend_dkim" {
  name    = "resend._domainkey.househunt"
  type    = "TXT"
  ttl     = 1
  proxied = false
  zone_id = local.zone_id
  content = "p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCf/DqAOvL07oN+C5vCiHmdZLR+wrU0AgnetBKhbkBK919dCk7Sl7qNZTyKJeaXgCTnSQQdMaJuZ0dAeobDXwKZhvR2nFHgkwxYM26GyhCIp3Tz5FIYm4FXux1bPu+e2INUGK3OhV2vC9l92a1Ij35GZrbU36EZU0TNJsjluir6HQIDAQAB"
}

resource "cloudflare_dns_record" "househunt_resend_mx" {
  name     = "send.househunt"
  type     = "MX"
  priority = 10
  ttl      = 1
  proxied  = false
  zone_id  = local.zone_id
  content  = "feedback-smtp.eu-west-1.amazonses.com"
}

resource "cloudflare_dns_record" "househunt_resend_spf" {
  name    = "send.househunt"
  type    = "TXT"
  ttl     = 1
  proxied = false
  zone_id = local.zone_id
  content = "v=spf1 include:amazonses.com ~all"
}
