variable "environment" {
  type        = string
  description = "Target deployment environment"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be dev, staging, or prod."
  }
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid IPv4 CIDR range."
  }
}

variable "tags" {
  type        = map(string)
  description = "Resource governance tags"
  default = {
    Environment = "dev"
    ManagedBy   = "infraflow"
    Workload    = "networking"
  }
}
