terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  profile = var.aws_credentials_profile
  region  = var.aws_region
  version = "~> 2.50.0"
}