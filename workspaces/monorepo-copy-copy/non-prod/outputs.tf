output "test2_bff_api_invoke_urls" {
  description = "API invoke URLs for all User BFF environments"
  value       = module.test2_bff.api_invoke_urls
}

output "test2_bff_lambda_function_names" {
  description = "Lambda function names for all User BFF environments"
  value       = module.test2_bff.lambda_function_names
}

output "test2_bff_lambda_function_arns" {
  description = "Lambda function ARNs for all User BFF environments"
  value       = module.test2_bff.lambda_function_arns
}

output "test2_bff_api_ids" {
  description = "API Gateway IDs for all User BFF environments"
  value       = module.test2_bff.api_ids
}

# Individual environment outputs for easy access
output "test2_bff_dev_api_url" {
  description = "Dev environment API URL"
  value       = module.test2_bff.dev_api_url
}

output "test2_bff_demo_api_url" {
  description = "Demo environment API URL"
  value       = module.test2_bff.demo_api_url
}

output "test2_bff_stg_api_url" {
  description = "Staging environment API URL"
  value       = module.test2_bff.stg_api_url
}

output "test2_bff_perf_api_url" {
  description = "Performance testing environment API URL"
  value       = module.test2_bff.perf_api_url
}