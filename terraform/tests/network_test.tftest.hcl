# Networking Infrastructure Native Test Suite

run "verify_vpc_cidr_and_subnets" {
  command = plan

  assert {
    condition     = var.vpc_cidr == "10.0.0.0/16"
    error_message = "Default VPC CIDR must be 10.0.0.0/16."
  }

  assert {
    condition     = var.environment == "dev"
    error_message = "Default environment must be 'dev'."
  }
}

run "verify_custom_network" {
  command = plan

  variables {
    environment = "prod"
    vpc_cidr    = "172.16.0.0/16"
  }

  assert {
    condition     = var.vpc_cidr == "172.16.0.0/16"
    error_message = "VPC CIDR mismatch in production configuration."
  }

  assert {
    condition     = var.environment == "prod"
    error_message = "Production environment mismatch."
  }
}
