variable "workspace_api_log_group_arn" {
  description = "ARN of the centralized CloudWatch log group for API Gateway (from parent module)"
  type        = string
}

variable "env_type" {
  description = "Environment type: 'nonprod' (dev, demo, stg, perf) or 'prod' (prod)"
  type        = string
  default     = "nonprod"

  validation {
    condition     = contains(["nonprod", "prod"], var.env_type)
    error_message = "env_type must be either 'nonprod' or 'prod'."
  }
}
