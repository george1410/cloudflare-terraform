resource "cloudflare_record" "root_a_vercel" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "76.76.21.21"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "letsencrypt" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "CAA"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
  data {
    flags = 0
    tag   = "issue"
    value = "letsencrypt.org"
  }
}

resource "cloudflare_record" "calendar_subdomain" {
  name    = "calendar"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.googlehosted.com"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "drive_subdomain" {
  name    = "drive"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.googlehosted.com"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "mail_subdomain" {
  name    = "mail"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "ghs.googlehosted.com"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "www_subdomain_vercel" {
  name    = "www"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com."
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "mail_primary" {
  name     = "georgemccarron.com"
  priority = 1
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "aspmx.l.google.com"
  zone_id  = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "mail_alt_1" {
  name     = "georgemccarron.com"
  priority = 5
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "alt1.aspmx.l.google.com"
  zone_id  = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "mail_alt_2" {
  name     = "georgemccarron.com"
  priority = 5
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "alt2.aspmx.l.google.com"
  zone_id  = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "mail_alt_3" {
  name     = "georgemccarron.com"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "alt3.aspmx.l.google.com"
  zone_id  = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "mail_alt_4" {
  name     = "georgemccarron.com"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "alt4.aspmx.l.google.com"
  zone_id  = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "r53_ns_1" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "ns-627.awsdns-14.net"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "r53_ns_2" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "ns-314.awsdns-39.com"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "r53_ns_3" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "ns-1664.awsdns-16.co.uk"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "r53_ns_4" {
  name    = "aws"
  proxied = false
  ttl     = 1
  type    = "NS"
  value   = "ns-1278.awsdns-31.org"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "gmail_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=none"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "hibp_verification" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "have-i-been-pwned-verification=631ce70aff80ff053ab2c5719e8141ef"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "gmail_spf" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:_spf.google.com ~all"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "google_site_verification" {
  name    = "georgemccarron.com"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "google-site-verification=-gtMxdeTYzmCCYuBtzD-f8n0JNKyl-s1qRmeguoWGD4"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}

resource "cloudflare_record" "gmail_dkim" {
  name    = "google._domainkey"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA28eLjC3k7Y0ESfofSUyFjdy0SE7gNKSsKhABPcrn8gaXtXXs/+4YNyx2rOWZbylwcKBAS5yto5OvlQN1zPmpgk3xaAvzlJ2OIQJDdl7Ltz9vZCRyZF2bBZT3QWrdTs+BFUpzExFfdbM04Ew0SL3P+2ymg64LJMPBG6Z4mlVNkzQhqpUx7ylcKj99JOkUi3aicBt5r/cpbyrkbVKH+iPRB+Zn9i5L3kiluIhdMEeK1R2U9hQsS9EBTpU5llwTlwQVzx3eeLyLgZ1fgLMeNGT1P5Mu8Moq7MxSjj+rlv8fk9D0+o1PHcalmgf8B4XZnBeAnvvSoaj9c6F0zpTm3QvD8QIDAQAB"
  zone_id = "50ce096d2ab993a329778b750e9f7573"
}
