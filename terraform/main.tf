# Networking Infrastructure Reference Module — Cloud-Free Simulation
# Models VPC, Subnets, and Security Groups using terraform_data.

terraform {
  required_version = ">= 1.6.0"
}

resource "terraform_data" "vpc" {
  input = {
    vpc_id     = "vpc-${var.environment}-001"
    cidr_block = var.vpc_cidr
    tags       = var.tags
  }
}

resource "terraform_data" "public_subnet" {
  input = {
    subnet_id = "subnet-${var.environment}-pub-01"
    vpc_id    = terraform_data.vpc.output.vpc_id
    cidr      = cidrsubnet(var.vpc_cidr, 4, 1)
    type      = "public"
  }
}

resource "terraform_data" "private_subnet" {
  input = {
    subnet_id = "subnet-${var.environment}-priv-01"
    vpc_id    = terraform_data.vpc.output.vpc_id
    cidr      = cidrsubnet(var.vpc_cidr, 4, 2)
    type      = "private"
  }
}
