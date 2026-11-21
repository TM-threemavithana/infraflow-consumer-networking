output "vpc_id" {
  description = "Identifier of the simulated VPC"
  value       = terraform_data.vpc.output.vpc_id
}

output "public_subnet_id" {
  description = "Identifier of the simulated public subnet"
  value       = terraform_data.public_subnet.output.subnet_id
}

output "private_subnet_id" {
  description = "Identifier of the simulated private subnet"
  value       = terraform_data.private_subnet.output.subnet_id
}
