locals {
  environments = {
    dev = {
      function_name = "dev-deals-bff"
      description   = "Deals BFF - Backend for Frontend for Deals services in dev environment"
      memory_size   = 256
      timeout       = 30

      environment_variables = {
        ENVIRONMENT = "dev"
        SERVICE     = "deals-bff"
        LOG_LEVEL   = "debug"
      }

      role_name = "dev-deals-bff-role"
      api_name  = "dev-deals-bff-api"

      log_retention_days = 7


      tags = {
        Team        = "platform"
        Project     = "deals-bff"
        Service     = "deals-bff"
        Environment = "dev"
      }
    }

    demo = {
      function_name = "demo-deals-bff"
      description   = "Deals BFF - Backend for Frontend for Deals services in demo environment"
      memory_size   = 256
      timeout       = 30

      environment_variables = {
        ENVIRONMENT = "demo"
        SERVICE     = "deals-bff"
        LOG_LEVEL   = "info"
      }

      role_name = "demo-deals-bff-role"
      api_name  = "demo-deals-bff-api"

      log_retention_days = 7


      tags = {
        Team        = "platform"
        Project     = "deals-bff"
        Service     = "deals-bff"
        Environment = "demo"
      }
    }

    stg = {
      function_name = "stg-deals-bff"
      description   = "Deals BFF - Backend for Frontend for Deals services in staging environment"
      memory_size   = 512
      timeout       = 60

      environment_variables = {
        ENVIRONMENT = "stg"
        SERVICE     = "deals-bff"
        LOG_LEVEL   = "info"
      }

      role_name = "stg-deals-bff-role"
      api_name  = "stg-deals-bff-api"

      log_retention_days = 14


      tags = {
        Team        = "platform"
        Project     = "deals-bff"
        Service     = "deals-bff"
        Environment = "stg"
      }
    }

    perf = {
      function_name = "perf-deals-bff"
      description   = "Deals BFF - Backend for Frontend for Deals services in performance testing environment"
      memory_size   = 1024
      timeout       = 60

      environment_variables = {
        ENVIRONMENT = "perf"
        SERVICE     = "deals-bff"
        LOG_LEVEL   = "warn"
      }

      role_name = "perf-deals-bff-role"
      api_name  = "perf-deals-bff-api"

      log_retention_days = 3


      tags = {
        Team        = "platform"
        Project     = "deals-bff"
        Service     = "deals-bff"
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
