variable "access_key" {}
variable "aws_profile" {}
variable "secret_key" {}
variable "region" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
  backend "s3" {}
}

provider "aws" {
  profile    = var.aws_profile
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

locals {
  key_for_tfstate = "main.tfstate"
}

# sample VPC
resource "aws_vpc" "dev-main-vpc" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "dev-vpc"
  }
}
