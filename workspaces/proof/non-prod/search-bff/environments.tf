locals {
  environments = {
    dev = {
      function_name = "dev-search-bff"
      description   = "Search BFF - Backend for Frontend for Search services in dev environment"
      memory_size   = 256
      timeout       = 30

      environment_variables = {
        ENVIRONMENT = "dev"
        SERVICE     = "search-bff"
        LOG_LEVEL   = "debug"
      }

      role_name = "dev-search-bff-role"
      api_name  = "dev-search-bff-api"

      log_retention_days = 7


      tags = {
        Team        = "platform"
        Project     = "search-bff"
        Service     = "search-bff"
        Environment = "dev"
      }
    }

    demo = {
      function_name = "demo-search-bff"
      description   = "Search BFF - Backend for Frontend for Search services in demo environment"
      memory_size   = 256
      timeout       = 30

      environment_variables = {
        ENVIRONMENT = "demo"
        SERVICE     = "search-bff"
        LOG_LEVEL   = "info"
      }

      role_name = "demo-search-bff-role"
      api_name  = "demo-search-bff-api"

      log_retention_days = 7


      tags = {
        Team        = "platform"
        Project     = "search-bff"
        Service     = "search-bff"
        Environment = "demo"
      }
    }

    stg = {
      function_name = "stg-search-bff"
      description   = "Search BFF - Backend for Frontend for Search services in staging environment"
      memory_size   = 512
      timeout       = 60

      environment_variables = {
        ENVIRONMENT = "stg"
        SERVICE     = "search-bff"
        LOG_LEVEL   = "info"
      }

      role_name = "stg-search-bff-role"
      api_name  = "stg-search-bff-api"

      log_retention_days = 14


      tags = {
        Team        = "platform"
        Project     = "search-bff"
        Service     = "search-bff"
        Environment = "stg"
      }
    }

    perf = {
      function_name = "perf-search-bff"
      description   = "Search BFF - Backend for Frontend for Search services in performance testing environment"
      memory_size   = 1024
      timeout       = 60

      environment_variables = {
        ENVIRONMENT = "perf"
        SERVICE     = "search-bff"
        LOG_LEVEL   = "warn"
      }

      role_name = "perf-search-bff-role"
      api_name  = "perf-search-bff-api"

      log_retention_days = 3


      tags = {
        Team        = "platform"
        Project     = "search-bff"
        Service     = "search-bff"
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
