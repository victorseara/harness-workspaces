# =============================================================================
# User BFF Outputs - All Environments
# =============================================================================
# The user_bff module outputs maps of all environments

output "user_bff_api_invoke_urls" {
  description = "API invoke URLs for all User BFF environments"
  value       = module.user_bff.api_invoke_urls
}

output "user_bff_lambda_function_names" {
  description = "Lambda function names for all User BFF environments"
  value       = module.user_bff.lambda_function_names
}

output "user_bff_lambda_function_arns" {
  description = "Lambda function ARNs for all User BFF environments"
  value       = module.user_bff.lambda_function_arns
}

output "user_bff_api_ids" {
  description = "API Gateway IDs for all User BFF environments"
  value       = module.user_bff.api_ids
}

# Individual environment outputs for easy access
output "user_bff_dev_api_url" {
  description = "Dev environment API URL"
  value       = module.user_bff.dev_api_url
}

output "user_bff_demo_api_url" {
  description = "Demo environment API URL"
  value       = module.user_bff.demo_api_url
}

output "user_bff_stg_api_url" {
  description = "Staging environment API URL"
  value       = module.user_bff.stg_api_url
}

output "user_bff_perf_api_url" {
  description = "Performance testing environment API URL"
  value       = module.user_bff.perf_api_url
}


output "homepage_api_invoke_urls" {
  description = "API invoke URLs for all User BFF environments"
  value       = module.homepage.api_invoke_urls
}

output "homepage_lambda_function_names" {
  description = "Lambda function names for all User BFF environments"
  value       = module.homepage.lambda_function_names
}

output "homepage_lambda_function_arns" {
  description = "Lambda function ARNs for all User BFF environments"
  value       = module.homepage.lambda_function_arns
}

output "homepage_api_ids" {
  description = "API Gateway IDs for all User BFF environments"
  value       = module.homepage.api_ids
}

# Individual environment outputs for easy access
output "homepage_dev_api_url" {
  description = "Dev environment API URL"
  value       = module.homepage.dev_api_url
}

output "homepage_demo_api_url" {
  description = "Demo environment API URL"
  value       = module.homepage.demo_api_url
}

output "homepage_stg_api_url" {
  description = "Staging environment API URL"
  value       = module.homepage.stg_api_url
}

output "homepage_perf_api_url" {
  description = "Performance testing environment API URL"
  value       = module.homepage.perf_api_url
}
