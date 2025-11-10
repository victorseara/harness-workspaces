# =============================================================================
# User BFF Outputs - All Environments
# =============================================================================
# The test_bff module outputs maps of all environments

output "test_bff_api_invoke_urls" {
  description = "API invoke URLs for all User BFF environments"
  value       = module.test_bff.api_invoke_urls
}

output "test_bff_lambda_function_names" {
  description = "Lambda function names for all User BFF environments"
  value       = module.test_bff.lambda_function_names
}

output "test_bff_lambda_function_arns" {
  description = "Lambda function ARNs for all User BFF environments"
  value       = module.test_bff.lambda_function_arns
}

output "test_bff_api_ids" {
  description = "API Gateway IDs for all User BFF environments"
  value       = module.test_bff.api_ids
}

# Individual environment outputs for easy access
output "test_bff_dev_api_url" {
  description = "Dev environment API URL"
  value       = module.test_bff.dev_api_url
}

output "test_bff_demo_api_url" {
  description = "Demo environment API URL"
  value       = module.test_bff.demo_api_url
}

output "test_bff_stg_api_url" {
  description = "Staging environment API URL"
  value       = module.test_bff.stg_api_url
}

output "test_bff_perf_api_url" {
  description = "Performance testing environment API URL"
  value       = module.test_bff.perf_api_url
}


output "homepage_bff_api_invoke_urls" {
  description = "API invoke URLs for all User BFF environments"
  value       = module.homepage_bff.api_invoke_urls
}

output "homepage_bff_lambda_function_names" {
  description = "Lambda function names for all User BFF environments"
  value       = module.homepage_bff.lambda_function_names
}

output "homepage_bff_lambda_function_arns" {
  description = "Lambda function ARNs for all User BFF environments"
  value       = module.homepage_bff.lambda_function_arns
}

output "homepage_bff_api_ids" {
  description = "API Gateway IDs for all User BFF environments"
  value       = module.homepage_bff.api_ids
}

# Individual environment outputs for easy access
output "homepage_bff_dev_api_url" {
  description = "Dev environment API URL"
  value       = module.homepage_bff.dev_api_url
}

output "homepage_bff_demo_api_url" {
  description = "Demo environment API URL"
  value       = module.homepage_bff.demo_api_url
}

output "homepage_bff_stg_api_url" {
  description = "Staging environment API URL"
  value       = module.homepage_bff.stg_api_url
}

output "homepage_bff_perf_api_url" {
  description = "Performance testing environment API URL"
  value       = module.homepage_bff.perf_api_url
}
