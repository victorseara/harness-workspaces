# =============================================================================
# User BFF Outputs - All Environments
# =============================================================================

output "user_bff_api_invoke_urls" {
  description = "API invoke URLs for all User BFF environments"
  value = {
    for env, bff in module.user_bff : env => bff.api_invoke_url
  }
}

output "user_bff_lambda_function_names" {
  description = "Lambda function names for all User BFF environments"
  value = {
    for env, bff in module.user_bff : env => bff.lambda_function_name
  }
}

output "user_bff_lambda_function_arns" {
  description = "Lambda function ARNs for all User BFF environments"
  value = {
    for env, bff in module.user_bff : env => bff.lambda_function_arn
  }
}

output "user_bff_api_ids" {
  description = "API Gateway IDs for all User BFF environments"
  value = {
    for env, bff in module.user_bff : env => bff.api_id
  }
}

# Individual environment outputs for easy access
output "user_bff_dev_api_url" {
  description = "Dev environment API URL"
  value       = module.user_bff["dev"].api_invoke_url
}

output "user_bff_demo_api_url" {
  description = "Demo environment API URL"
  value       = module.user_bff["demo"].api_invoke_url
}

output "user_bff_stg_api_url" {
  description = "Staging environment API URL"
  value       = module.user_bff["stg"].api_invoke_url
}

output "user_bff_perf_api_url" {
  description = "Performance testing environment API URL"
  value       = module.user_bff["perf"].api_invoke_url
}

# =============================================================================
# Add outputs for additional BFFs as they are created
# =============================================================================
# Example:
# output "auth_bff_api_invoke_urls" {
#   description = "API invoke URLs for all Auth BFF environments"
#   value = {
#     for env, bff in module.auth_bff : env => bff.api_invoke_url
#   }
# }
