# Lambda Configuration
variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "description" {
  description = "Description of the Lambda function"
  type        = string
  default     = ""
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
  default     = "main.handler"
}

variable "runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "nodejs20.x"
}

variable "timeout" {
  description = "Function timeout in seconds"
  type        = number
  default     = 30
}

variable "memory_size" {
  description = "Memory size in MB"
  type        = number
  default     = 128
}

variable "source_dir" {
  description = "Path to the directory containing Lambda source files to zip. If null, uses the module directory (which contains lambda-placeholder.js by default)"
  type        = string
  default     = null
}

variable "output_path" {
  description = "Path where the Lambda zip file will be created. If null, creates in .terraform/lambda-package.zip"
  type        = string
  default     = null
}

variable "environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}

variable "role_name" {
  description = "Name of the IAM role (defaults to {function_name}-role)"
  type        = string
  default     = null
}

variable "custom_policy_json" {
  description = "Custom IAM policy JSON for the Lambda function"
  type        = string
  default     = null
}

variable "ignore_source_code_hash" {
  description = "Whether to ignore changes to source code hash (set to true when deployments are handled outside Terraform)"
  type        = bool
  default     = true
}

# API Gateway Configuration
variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "api_description" {
  description = "Description of the API Gateway"
  type        = string
  default     = ""
}

variable "integration_timeout_ms" {
  description = "Integration timeout in milliseconds (50-30000)"
  type        = number
  default     = 30000
}

# CORS Configuration
variable "cors_allow_origins" {
  description = "CORS allowed origins"
  type        = list(string)
  default     = ["*"]
}

variable "cors_allow_methods" {
  description = "CORS allowed methods"
  type        = list(string)
  default     = ["GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS", "HEAD"]
}

variable "cors_allow_headers" {
  description = "CORS allowed headers"
  type        = list(string)
  default     = ["*"]
}

variable "cors_expose_headers" {
  description = "CORS exposed headers"
  type        = list(string)
  default     = []
}

variable "cors_max_age" {
  description = "CORS max age in seconds"
  type        = number
  default     = 300
}

variable "cors_allow_credentials" {
  description = "Whether to allow credentials in CORS"
  type        = bool
  default     = false
}

variable "stage_depends_on" {
  description = "A list of resources the API Gateway stage should explicitly depend on."
  type        = list(any)
  default     = []
}

# Shared Configuration
variable "log_retention_days" {
  description = "CloudWatch log retention in days (applies to both Lambda and API Gateway)"
  type        = number
  default     = 7
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
