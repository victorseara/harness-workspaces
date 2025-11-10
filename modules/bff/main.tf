# Archive the Lambda placeholder or source files into a zip
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = var.source_dir != null ? var.source_dir : "${path.module}"
  output_path = var.output_path != null ? var.output_path : "${path.module}/.terraform/lambda-package.zip"

  # Only include specific files if source_dir is not set (using module directory)
  excludes = var.source_dir != null ? [] : [
    ".terraform",
    ".terraform.lock.hcl",
    "main.tf",
    "variables.tf",
    "outputs.tf",
    "README.md",
    "versions.tf",
    ".git",
    "*.zip"
  ]
}

# Create Lambda function first without API Gateway permission
module "lambda" {
  source = "git::https://github.com/victorseara/harness-root-iac.git//modules/lambda?ref=main"

  function_name = var.function_name
  description   = var.description
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout
  memory_size   = var.memory_size
  filename      = data.archive_file.lambda_zip.output_path

  environment_variables = var.environment_variables

  role_name          = var.role_name
  custom_policy_json = var.custom_policy_json
  log_retention_days = var.log_retention_days

  ignore_source_code_hash = var.ignore_source_code_hash

  # API Gateway permission will be added after API Gateway is created
  create_api_gateway_permission = true
  api_gateway_execution_arn     = "${module.api_gateway.api_execution_arn}/*"

  tags = var.tags
}

# Create API Gateway and integrate with Lambda
module "api_gateway" {
  source = "git::https://github.com/victorseara/harness-root-iac.git//modules/api-gateway?ref=main"

  api_name    = var.api_name
  description = var.api_description
  lambda_arn  = module.lambda.invoke_arn

  integration_timeout_ms = var.integration_timeout_ms

  # CORS configuration
  cors_allow_origins     = var.cors_allow_origins
  cors_allow_methods     = var.cors_allow_methods
  cors_allow_headers     = var.cors_allow_headers
  cors_expose_headers    = var.cors_expose_headers
  cors_max_age           = var.cors_max_age
  cors_allow_credentials = var.cors_allow_credentials

  tags = var.tags
}
