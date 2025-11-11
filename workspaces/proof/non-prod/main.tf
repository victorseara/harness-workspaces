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

module "homepage_bff" {
  source = "./homepage-bff"
}

module "orders_bff" {
  source = "./orders-bff"
}

module "search_bff" {
  source = "./search-bff"
}
