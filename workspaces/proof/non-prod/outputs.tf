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

# Orders BFF Outputs
output "orders_bff_api_invoke_urls" {
  description = "API invoke URLs for all User BFF environments"
  value       = module.orders_bff.api_invoke_urls
}

output "orders_bff_lambda_function_names" {
  description = "Lambda function names for all User BFF environments"
  value       = module.orders_bff.lambda_function_names
}

output "orders_bff_lambda_function_arns" {
  description = "Lambda function ARNs for all User BFF environments"
  value       = module.orders_bff.lambda_function_arns
}

output "orders_bff_api_ids" {
  description = "API Gateway IDs for all User BFF environments"
  value       = module.orders_bff.api_ids
}

# Individual environment outputs for easy access
output "orders_bff_dev_api_url" {
  description = "Dev environment API URL"
  value       = module.orders_bff.dev_api_url
}

output "orders_bff_demo_api_url" {
  description = "Demo environment API URL"
  value       = module.orders_bff.demo_api_url
}

output "orders_bff_stg_api_url" {
  description = "Staging environment API URL"
  value       = module.orders_bff.stg_api_url
}

output "orders_bff_perf_api_url" {
  description = "Performance testing environment API URL"
  value       = module.orders_bff.perf_api_url
}

# Search BFF Outputs
output "search_bff_api_invoke_urls" {
  description = "API invoke URLs for all User BFF environments"
  value       = module.search_bff.api_invoke_urls
}

output "search_bff_lambda_function_names" {
  description = "Lambda function names for all User BFF environments"
  value       = module.search_bff.lambda_function_names
}

output "search_bff_lambda_function_arns" {
  description = "Lambda function ARNs for all User BFF environments"
  value       = module.search_bff.lambda_function_arns
}

output "search_bff_api_ids" {
  description = "API Gateway IDs for all User BFF environments"
  value       = module.search_bff.api_ids
}

# Individual environment outputs for easy access
output "search_bff_dev_api_url" {
  description = "Dev environment API URL"
  value       = module.search_bff.dev_api_url
}

output "search_bff_demo_api_url" {
  description = "Demo environment API URL"
  value       = module.search_bff.demo_api_url
}

output "search_bff_stg_api_url" {
  description = "Staging environment API URL"
  value       = module.search_bff.stg_api_url
}

output "search_bff_perf_api_url" {
  description = "Performance testing environment API URL"
  value       = module.search_bff.perf_api_url
}
