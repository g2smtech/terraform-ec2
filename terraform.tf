terraform {
  backend "s3" {
    bucket = "terraform-bucket-19122019"
    key    = "cloudwatch-demo/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "us-east-1"
}