provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "nonprod"
      ManagedBy   = "terraform"
      Workspace   = var.workspace_name
    }
  }
}

# Workspace foundations - centralized logging and shared infrastructure
module "workspace" {
  source = "git@github.com:victorseara/harness-xp.git//devops/modules/foundations-workspace?ref=main"

  workspace_name     = var.workspace_name
  log_retention_days = 30

  tags = {
    Environment = "nonprod"
  }
}

module "homepage_bff" {
  source = "git@github.com:victorseara/harness-xp.git//foundations-iac/apps/homepage-bff?ref=main"

  env_type                    = var.env_type
  workspace_api_log_group_arn = module.workspace.workspace_api_log_group_arn
}