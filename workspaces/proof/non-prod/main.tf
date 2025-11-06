terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "non-prod"
      ManagedBy   = "terraform"
      Workspace   = "non-prod-user-repo"
    }
  }
}

# =============================================================================
# User BFF Module
# =============================================================================
# The user-bff module internally creates all environments (dev, demo, stg, perf)
# and manages their configurations. No need to pass environment-specific configs here.

module "user_bff" {
  source = "./user-bff"
}

# =============================================================================
# Add more BFF modules here as needed
# =============================================================================
# Example:
# module "auth_bff" {
#   source = "./auth-bff"
# }
#
# module "order_bff" {
#   source = "./order-bff"
# }
