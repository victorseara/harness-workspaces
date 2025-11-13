# API Gateway Outputs
output "api_gateway_endpoints" {
  description = "API Gateway endpoint URLs for all Homepage BFF environments"
  value = {
    for env, bff in module.homepage_bff : env => bff.api_gateway_endpoint
  }
}

output "api_gateway_ids" {
  description = "API Gateway IDs for all Homepage BFF environments"
  value = {
    for env, bff in module.homepage_bff : env => bff.api_gateway_id
  }
}

# Lambda Function Outputs
output "lambda_function_names" {
  description = "Lambda function names for all Homepage BFF environments"
  value = {
    for env, bff in module.homepage_bff : env => bff.lambda_function_name
  }
}

output "lambda_function_arns" {
  description = "Lambda function ARNs for all Homepage BFF environments"
  value = {
    for env, bff in module.homepage_bff : env => bff.lambda_function_arn
  }
}

# IAM Role Outputs
output "lambda_role_arns" {
  description = "Lambda execution role ARNs for all Homepage BFF environments"
  value = {
    for env, bff in module.homepage_bff : env => bff.lambda_role_arn
  }
}

# CloudWatch Logs Outputs
output "lambda_log_group_names" {
  description = "CloudWatch log group names for all Homepage BFF environments"
  value = {
    for env, bff in module.homepage_bff : env => bff.lambda_log_group_name
  }
}

# Secrets Outputs
output "secrets" {
  description = "Created secrets for each environment"
  value = {
    for env, bff in module.homepage_bff : env => bff.secrets
  }
  sensitive = true
}
