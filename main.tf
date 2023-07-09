terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket  = "george1410-cloudflare-terraform-state"
    key     = "state/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}

provider "cloudflare" {
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "remote_terraform_state" {
  bucket = "george1410-cloudflare-terraform-state"
}

resource "aws_s3_bucket_versioning" "remote_terraform_state_versioning" {
  bucket = aws_s3_bucket.remote_terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
