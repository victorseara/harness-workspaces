variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "workspace_name" {
  description = "Name of the Terraform workspace (e.g., 'team-homepage', 'team-checkout')"
  type        = string
  default     = "non-prod-user-repo"
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