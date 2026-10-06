terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "cortex_test" {
  bucket = "cortex-appsec-test-not-deployed"
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "cortex_test" {
  bucket                  = aws_s3_bucket.cortex_test.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
