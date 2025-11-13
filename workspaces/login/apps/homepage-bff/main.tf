terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "login_bff" {
  source   = "git::https://github.com/victorseara/harness-root-iac.git//modules/lambda-node-bff?ref=main"
  for_each = local.environments

  app_name    = "${each.key}-login-bff"
  description = "login BFF - Express.js application running on Lambda (${each.key} environment)"

  # Lambda Configuration
  # Code managed via separate deployment pipeline
  # Placeholder from modules/lambda-node-bff/main.js is used automatically
  ignore_source_code_changes     = true
  lambda_handler                 = "main.handler"
  lambda_runtime                 = "nodejs20.x"
  lambda_timeout                 = each.value.lambda_timeout
  lambda_memory_size             = each.value.lambda_memory_size
  reserved_concurrent_executions = each.value.reserved_concurrent_executions
  environment_variables          = each.value.environment_variables
  log_retention_days             = each.value.log_retention_days

  # API Gateway Configuration
  api_gateway_description        = "API Gateway for login BFF (${each.key})"
  cors_allow_origins             = each.value.cors_allow_origins
  cors_allow_methods             = ["GET", "POST", "OPTIONS"]
  cors_allow_headers             = ["Content-Type", "Authorization", "X-Api-Key"]
  cors_expose_headers            = []
  cors_max_age                   = 600
  integration_timeout_ms         = each.value.lambda_timeout * 1000 - 1000
  throttling_burst_limit         = each.value.throttling_burst_limit
  throttling_rate_limit          = each.value.throttling_rate_limit
  centralized_api_log_group_arn  = var.workspace_api_log_group_arn
  bff_name                       = "${each.key}-login-bff"
  environment                    = each.key

  # Secrets (optional - example configuration)
  secrets = each.value.secrets

  tags = {
    Environment = each.key
    Project     = "login-bff"
    BFF         = "login"
  }
}
