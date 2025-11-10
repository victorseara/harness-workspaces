# Lambda Outputs
output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = module.lambda.function_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda.function_arn
}

output "lambda_invoke_arn" {
  description = "Invoke ARN of the Lambda function"
  value       = module.lambda.invoke_arn
}

output "lambda_role_arn" {
  description = "ARN of the Lambda IAM role"
  value       = module.lambda.role_arn
}

output "lambda_role_name" {
  description = "Name of the Lambda IAM role"
  value       = module.lambda.role_name
}

output "lambda_qualified_arn" {
  description = "Qualified ARN of the Lambda function"
  value       = module.lambda.qualified_arn
}

output "lambda_version" {
  description = "Latest published version of the Lambda function"
  value       = module.lambda.version
}

# API Gateway Outputs
output "api_id" {
  description = "ID of the API Gateway"
  value       = module.api_gateway.api_id
}

output "api_endpoint" {
  description = "Endpoint URL of the API Gateway"
  value       = module.api_gateway.api_endpoint
}

output "api_execution_arn" {
  description = "Execution ARN of the API Gateway"
  value       = module.api_gateway.api_execution_arn
}

output "api_invoke_url" {
  description = "Invoke URL of the API Gateway default stage"
  value       = module.api_gateway.default_stage_invoke_url
}

output "api_stage_id" {
  description = "ID of the API Gateway default stage"
  value       = module.api_gateway.default_stage_id
}

output "api_stage_execution_arn" {
  description = "Execution ARN of the API Gateway default stage"
  value       = module.api_gateway.default_stage_execution_arn
}
