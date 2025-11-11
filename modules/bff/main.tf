# Archive the Lambda source files into a zip
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

# CloudWatch Log Group for Lambda
module "lambda_logs" {
  source = "git::https://github.com/victorseara/harness-root-iac.git//modules/cloudwatch?ref=main"

  log_group_name    = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_retention_days

  tags = var.tags
}

# CloudWatch Log Group for API Gateway
module "api_gateway_logs" {
  source = "git::https://github.com/victorseara/harness-root-iac.git//modules/cloudwatch?ref=main"

  log_group_name    = "/aws/apigateway/${var.api_name}"
  retention_in_days = var.log_retention_days

  tags = var.tags
}

# IAM Role for Lambda
module "iam" {
  source = "git::https://github.com/victorseara/harness-root-iac.git//modules/iam?ref=main"

  role_name = var.role_name != null ? var.role_name : "${var.function_name}-role"

  tags = var.tags
}

# Lambda Function
module "lambda" {
  source = "git::https://github.com/victorseara/harness-root-iac.git//modules/lambda?ref=main"

  filename      = data.archive_file.lambda_zip.output_path
  function_name = var.function_name
  role_arn      = module.iam.role_arn
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout
  memory_size   = var.memory_size
  description   = var.description

  environment_variables = var.environment_variables

  tags = var.tags

  depends_on = [
    module.iam,
    module.lambda_logs
  ]
}

# API Gateway
module "api_gateway" {
  source = "git::https://github.com/victorseara/harness-root-iac.git//modules/api-gateway?ref=main"

  api_name           = var.api_name
  description        = var.api_description
  lambda_invoke_arn  = module.lambda.invoke_arn
  log_group_arn      = module.api_gateway_logs.log_group_arn

  integration_timeout_ms = var.integration_timeout_ms

  cors_allow_origins     = var.cors_allow_origins
  cors_allow_methods     = var.cors_allow_methods
  cors_allow_headers     = var.cors_allow_headers
  cors_expose_headers    = var.cors_expose_headers
  cors_max_age           = var.cors_max_age
  cors_allow_credentials = var.cors_allow_credentials

  tags = var.tags
}

# Lambda permission for API Gateway
resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${module.api_gateway.api_execution_arn}/*"
}
