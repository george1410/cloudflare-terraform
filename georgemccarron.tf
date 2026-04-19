resource "cloudflare_dns_record" "root_a_vercel" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "A"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "76.76.21.21"
}

moved {
  from = cloudflare_record.root_a_vercel
  to   = cloudflare_dns_record.root_a_vercel
}

resource "cloudflare_dns_record" "letsencrypt" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "CAA"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  data = {
    flags = 0
    tag   = "issue"
    value = "letsencrypt.org"
  }
}

moved {
  from = cloudflare_record.letsencrypt
  to   = cloudflare_dns_record.letsencrypt
}

resource "cloudflare_dns_record" "calendar_subdomain" {
  name    = "calendar"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "ghs.googlehosted.com"
}

moved {
  from = cloudflare_record.calendar_subdomain
  to   = cloudflare_dns_record.calendar_subdomain
}

resource "cloudflare_dns_record" "drive_subdomain" {
  name    = "drive"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "ghs.googlehosted.com"
}

moved {
  from = cloudflare_record.drive_subdomain
  to   = cloudflare_dns_record.drive_subdomain
}

resource "cloudflare_dns_record" "mail_subdomain" {
  name    = "mail"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "ghs.googlehosted.com"
}

moved {
  from = cloudflare_record.mail_subdomain
  to   = cloudflare_dns_record.mail_subdomain
}

resource "cloudflare_dns_record" "www_subdomain_vercel" {
  name    = "www"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "cname.vercel-dns.com."
}

moved {
  from = cloudflare_record.www_subdomain_vercel
  to   = cloudflare_dns_record.www_subdomain_vercel
}

resource "cloudflare_dns_record" "mail_primary" {
  name     = "georgemccarron.com"
  priority = 1
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = "50ce096d2ab993a329778b750e9f7573"
  content  = "aspmx.l.google.com"
}

moved {
  from = cloudflare_record.mail_primary
  to   = cloudflare_dns_record.mail_primary
}

resource "cloudflare_dns_record" "mail_alt_1" {
  name     = "georgemccarron.com"
  priority = 5
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = "50ce096d2ab993a329778b750e9f7573"
  content  = "alt1.aspmx.l.google.com"
}

moved {
  from = cloudflare_record.mail_alt_1
  to   = cloudflare_dns_record.mail_alt_1
}

resource "cloudflare_dns_record" "mail_alt_2" {
  name     = "georgemccarron.com"
  priority = 5
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = "50ce096d2ab993a329778b750e9f7573"
  content  = "alt2.aspmx.l.google.com"
}

moved {
  from = cloudflare_record.mail_alt_2
  to   = cloudflare_dns_record.mail_alt_2
}

resource "cloudflare_dns_record" "mail_alt_3" {
  name     = "georgemccarron.com"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = "50ce096d2ab993a329778b750e9f7573"
  content  = "alt3.aspmx.l.google.com"
}

moved {
  from = cloudflare_record.mail_alt_3
  to   = cloudflare_dns_record.mail_alt_3
}

resource "cloudflare_dns_record" "mail_alt_4" {
  name     = "georgemccarron.com"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  zone_id  = "50ce096d2ab993a329778b750e9f7573"
  content  = "alt4.aspmx.l.google.com"
}

moved {
  from = cloudflare_record.mail_alt_4
  to   = cloudflare_dns_record.mail_alt_4
}

resource "cloudflare_dns_record" "r53_ns_1" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "ns-627.awsdns-14.net"
}

moved {
  from = cloudflare_record.r53_ns_1
  to   = cloudflare_dns_record.r53_ns_1
}

resource "cloudflare_dns_record" "r53_ns_2" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "ns-314.awsdns-39.com"
}

moved {
  from = cloudflare_record.r53_ns_2
  to   = cloudflare_dns_record.r53_ns_2
}

resource "cloudflare_dns_record" "r53_ns_3" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "ns-1664.awsdns-16.co.uk"
}

moved {
  from = cloudflare_record.r53_ns_3
  to   = cloudflare_dns_record.r53_ns_3
}

resource "cloudflare_dns_record" "r53_ns_4" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "ns-1278.awsdns-31.org"
}

moved {
  from = cloudflare_record.r53_ns_4
  to   = cloudflare_dns_record.r53_ns_4
}

resource "cloudflare_dns_record" "gmail_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "v=DMARC1; p=none"
}

moved {
  from = cloudflare_record.gmail_dmarc
  to   = cloudflare_dns_record.gmail_dmarc
}

resource "cloudflare_dns_record" "hibp_verification" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "have-i-been-pwned-verification=631ce70aff80ff053ab2c5719e8141ef"
}

moved {
  from = cloudflare_record.hibp_verification
  to   = cloudflare_dns_record.hibp_verification
}

resource "cloudflare_dns_record" "gmail_spf" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "v=spf1 include:_spf.google.com ~all"
}

moved {
  from = cloudflare_record.gmail_spf
  to   = cloudflare_dns_record.gmail_spf
}

resource "cloudflare_dns_record" "google_site_verification" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "google-site-verification=-gtMxdeTYzmCCYuBtzD-f8n0JNKyl-s1qRmeguoWGD4"
}

moved {
  from = cloudflare_record.google_site_verification
  to   = cloudflare_dns_record.google_site_verification
}

resource "cloudflare_dns_record" "gmail_dkim" {
  name    = "google._domainkey"
  proxied = false
  ttl     = 1
  type    = "TXT"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  content = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA28eLjC3k7Y0ESfofSUyFjdy0SE7gNKSsKhABPcrn8gaXtXXs/+4YNyx2rOWZbylwcKBAS5yto5OvlQN1zPmpgk3xaAvzlJ2OIQJDdl7Ltz9vZCRyZF2bBZT3QWrdTs+BFUpzExFfdbM04Ew0SL3P+2ymg64LJMPBG6Z4mlVNkzQhqpUx7ylcKj99JOkUi3aicBt5r/cpbyrkbVKH+iPRB+Zn9i5L3kiluIhdMEeK1R2U9hQsS9EBTpU5llwTlwQVzx3eeLyLgZ1fgLMeNGT1P5Mu8Moq7MxSjj+rlv8fk9D0+o1PHcalmgf8B4XZnBeAnvvSoaj9c6F0zpTm3QvD8QIDAQAB"
}

moved {
  from = cloudflare_record.gmail_dkim
  to   = cloudflare_dns_record.gmail_dkim
}
