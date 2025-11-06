# =============================================================================
# Aggregated Outputs - All Environments
# =============================================================================

output "api_invoke_urls" {
  description = "API invoke URLs for all environments"
  value = {
    for env, bff in module.bff : env => bff.api_invoke_url
  }
}

output "lambda_function_names" {
  description = "Lambda function names for all environments"
  value = {
    for env, bff in module.bff : env => bff.lambda_function_name
  }
}

output "lambda_function_arns" {
  description = "Lambda function ARNs for all environments"
  value = {
    for env, bff in module.bff : env => bff.lambda_function_arn
  }
}

output "api_ids" {
  description = "API Gateway IDs for all environments"
  value = {
    for env, bff in module.bff : env => bff.api_id
  }
}

output "lambda_role_arns" {
  description = "Lambda IAM role ARNs for all environments"
  value = {
    for env, bff in module.bff : env => bff.lambda_role_arn
  }
}

# =============================================================================
# Individual Environment Outputs
# =============================================================================

output "dev_api_url" {
  description = "Dev environment API URL"
  value       = module.bff["dev"].api_invoke_url
}

output "demo_api_url" {
  description = "Demo environment API URL"
  value       = module.bff["demo"].api_invoke_url
}

output "stg_api_url" {
  description = "Staging environment API URL"
  value       = module.bff["stg"].api_invoke_url
}

output "perf_api_url" {
  description = "Performance testing environment API URL"
  value       = module.bff["perf"].api_invoke_url
}
