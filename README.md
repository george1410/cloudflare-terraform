# cloudflare-terraform

Terraform for `georgemccarron.com` DNS.

State in S3 bucket `george1410-cloudflare-terraform-state` (eu-west-2, account `559288702369`).

## Run

```sh
source .env                                   # export CLOUDFLARE_API_TOKEN into this shell
# put static AWS keys in ~/.aws/credentials
terraform plan
terraform apply
```
