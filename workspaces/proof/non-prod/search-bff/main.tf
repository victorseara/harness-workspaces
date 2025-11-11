# Search BFF Module
# This module creates user BFF instances for dev, demo, stg, and perf environments
# Environment configurations are defined in environments.tf

module "bff" {
  for_each = local.environments
  source   = "../../../../modules/bff"

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