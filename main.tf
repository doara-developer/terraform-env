terraform {
  required_version = ">= 0.11.0"
  backend "s3" {
    bucket  = "terraform-sample-332ec6ba-ddc3-40fb-9089-7a35458631ca"
    region  = "ap-northeast-1"
    key     = "terraform.tfstate"
    encrypt = true
  }
}
provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-sample"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-sample-332ec6ba-ddc3-40fb-9089-7a35458631ca"
  versioning {
    enabled = true
  }
}
