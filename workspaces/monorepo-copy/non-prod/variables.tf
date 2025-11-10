variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

# Each BFF module manages its own configuration via locals
# No BFF-specific variables needed at the workspace level
