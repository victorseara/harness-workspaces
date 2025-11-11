# =============================================================================
# API Gateway Account Configuration (Singleton)
# =============================================================================
# These resources are defined once per region to configure the API Gateway
# account settings for CloudWatch logging. This prevents race conditions
# and conflicts when deploying multiple APIs in parallel.

resource "aws_iam_role" "api_gateway_logging" {
  # Use a fixed name to ensure only one role is created per account
  name = "api-gateway-logging-to-cloudwatch"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = { Service = "apigateway.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy" "api_gateway_logging" {
  name   = "api-gateway-logging-to-cloudwatch-policy"
  role   = aws_iam_role.api_gateway_logging.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action   = ["logs:CreateLogStream", "logs:PutLogEvents", "logs:DescribeLogGroups", "logs:DescribeLogStreams"],
      Effect   = "Allow",
      Resource = "*"
    }]
  })
}

resource "aws_api_gateway_account" "this" {
  cloudwatch_role_arn = aws_iam_role.api_gateway_logging.arn
  depends_on          = [aws_iam_role_policy.api_gateway_logging]
}

# User BFF Module
# This module creates user BFF instances for dev, demo, stg, and perf environments
# Environment configurations are defined in environments.tf

module "bff" {
  for_each = local.environments
  source   = "../../../../modules/bff"

  # Pass dependency on the account configuration to the module
  stage_depends_on = [aws_api_gateway_account.this]

  # Lambda Configuration
  function_name = each.value.function_name
  description   = each.value.description
  handler       = local.default_handler
  runtime       = local.default_runtime
  timeout       = each.value.timeout
  memory_size   = each.value.memory_size
  source_dir    = local.default_source_dir
  output_path   = local.default_output_path

  environment_variables = each.value.environment_variables

  role_name          = each.value.role_name
  custom_policy_json = local.default_custom_policy_json

  ignore_source_code_hash = local.default_ignore_source_code_hash

  # API Gateway Configuration
  api_name               = each.value.api_name
  api_description        = "${each.value.description} API Gateway"
  integration_timeout_ms = local.default_integration_timeout_ms

  # CORS Configuration
  cors_allow_origins     = local.default_cors_allow_origins
  cors_allow_methods     = local.default_cors_allow_methods
  cors_allow_headers     = local.default_cors_allow_headers
  cors_expose_headers    = local.default_cors_expose_headers
  cors_max_age           = local.default_cors_max_age
  cors_allow_credentials = local.default_cors_allow_credentials

  # Shared Configuration
  log_retention_days = each.value.log_retention_days

  tags = each.value.tags
}