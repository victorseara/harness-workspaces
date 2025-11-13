# Outputs for Production Environment

# ============================================================
# Outputs for Homepage BFF in Production Environment
# ============================================================
output "homepage_bff_endpoints" {
  description = "API Gateway endpoint URLs for testing"
  value       = module.homepage_bff.api_gateway_endpoints
}

output "homepage_bff_lambda_functions" {
  description = "Lambda function names"
  value       = module.homepage_bff.lambda_function_names
}

output "homepage_bff_api_gateway_ids" {
  description = "API Gateway IDs"
  value       = module.homepage_bff.api_gateway_ids
}

# Homepage BFF - Sensitive outputs (secrets only)
output "homepage_bff_secrets" {
  description = "Secrets for Homepage BFF environments"
  value       = module.homepage_bff.secrets
  sensitive   = true
}

# ============================================================
# Outputs for Search BFF in Production Environment
# ============================================================
output "search_bff_endpoints" {
  description = "API Gateway endpoint URLs for testing"
  value       = module.search_bff.api_gateway_endpoints
}

output "search_bff_lambda_functions" {
  description = "Lambda function names"
  value       = module.search_bff.lambda_function_names
}

output "search_bff_api_gateway_ids" {
  description = "API Gateway IDs"
  value       = module.search_bff.api_gateway_ids
}

# Homepage BFF - Sensitive outputs (secrets only)
output "search_bff_secrets" {
  description = "Secrets for Homepage BFF environments"
  value       = module.search_bff.secrets
  sensitive   = true
}
