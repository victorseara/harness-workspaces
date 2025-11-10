# =============================================================================
# User BFF - Environment Configurations
# =============================================================================
# This file defines all environment-specific configurations for the User BFF
# Environments: dev, demo, stg, perf

locals {
  # Environment-specific configurations
  environments = {
    dev = {
      function_name = "dev-test-bff"
      description   = "User BFF - Backend for Frontend for User services in dev environment"
      memory_size   = 256
      timeout       = 30

      environment_variables = {
        ENVIRONMENT = "dev"
        SERVICE     = "test-bff"
        LOG_LEVEL   = "debug"
      }

      role_name = "dev-test-bff-role"
      api_name  = "dev-test-bff-api"

      log_retention_days = 7

      tags = {
        Team        = "platform"
        Project     = "user-services"
        Service     = "test-bff"
        Environment = "dev"
      }
    }

    demo = {
      function_name = "demo-test-bff"
      description   = "User BFF - Backend for Frontend for User services in demo environment"
      memory_size   = 256
      timeout       = 30

      environment_variables = {
        ENVIRONMENT = "demo"
        SERVICE     = "test-bff"
        LOG_LEVEL   = "info"
      }

      role_name = "demo-test-bff-role"
      api_name  = "demo-test-bff-api"

      log_retention_days = 7

      tags = {
        Team        = "platform"
        Project     = "user-services"
        Service     = "test-bff"
        Environment = "demo"
      }
    }

    stg = {
      function_name = "stg-test-bff"
      description   = "User BFF - Backend for Frontend for User services in staging environment"
      memory_size   = 512
      timeout       = 60

      environment_variables = {
        ENVIRONMENT = "stg"
        SERVICE     = "test-bff"
        LOG_LEVEL   = "info"
      }

      role_name = "stg-test-bff-role"
      api_name  = "stg-test-bff-api"

      log_retention_days = 14

      tags = {
        Team        = "platform"
        Project     = "user-services"
        Service     = "test-bff"
        Environment = "stg"
      }
    }

    perf = {
      function_name = "perf-test-bff"
      description   = "User BFF - Backend for Frontend for User services in performance testing environment"
      memory_size   = 1024
      timeout       = 60

      environment_variables = {
        ENVIRONMENT = "perf"
        SERVICE     = "test-bff"
        LOG_LEVEL   = "warn"
      }

      role_name = "perf-test-bff-role"
      api_name  = "perf-test-bff-api"

      log_retention_days = 3

      tags = {
        Team        = "platform"
        Project     = "user-services"
        Service     = "test-bff"
        Environment = "perf"
      }
    }
  }

  # =============================================================================
  # Common Defaults
  # =============================================================================
  # These defaults are applied to all environments

  default_handler                 = "main.handler"
  default_runtime                 = "nodejs20.x"
  default_source_dir              = null # Uses placeholder from BFF module
  default_output_path             = null
  default_custom_policy_json      = null
  default_ignore_source_code_hash = true
  default_integration_timeout_ms  = 30000

  # Default CORS configuration
  default_cors_allow_origins     = ["*"]
  default_cors_allow_methods     = ["GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS", "HEAD"]
  default_cors_allow_headers     = ["*"]
  default_cors_expose_headers    = []
  default_cors_max_age           = 300
  default_cors_allow_credentials = false
}
