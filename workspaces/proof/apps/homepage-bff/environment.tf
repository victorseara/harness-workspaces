locals {
  # Default configuration for all environments
  default_config = {
    lambda_timeout                 = 30
    lambda_memory_size             = 256
    reserved_concurrent_executions = null # No reserved concurrency (uses account default)
    log_retention_days             = 7
    throttling_burst_limit         = 100
    throttling_rate_limit          = 50
    environment_variables          = {}
    secrets                        = {}
  }

  # Environment configuration groups
  env_config_groups = {
    nonprod = ["dev", "demo", "stg", "perf"]
    prod     = ["prod"]
  }

  # Environment-specific overrides
  env_overrides = {
    dev = {
      cors_allow_origins = ["http://localhost:3000", "https://dev.yourdomain.com"]
      environment_variables = {
        NODE_ENV = "development"
      }
    }
    demo = {
      log_retention_days     = 14
      throttling_burst_limit = 200
      throttling_rate_limit  = 75
      cors_allow_origins     = ["https://demo.yourdomain.com"]
      environment_variables = {
        NODE_ENV = "demo"
      }
    }
    stg = {
      lambda_memory_size     = 512
      log_retention_days     = 14
      throttling_burst_limit = 500
      throttling_rate_limit  = 100
      cors_allow_origins     = ["https://stg.yourdomain.com"]
      environment_variables = {
        NODE_ENV = "staging"
      }
    }
    perf = {
      lambda_memory_size     = 1024
      log_retention_days     = 14
      throttling_burst_limit = 1000
      throttling_rate_limit  = 200
      cors_allow_origins     = ["https://perf.yourdomain.com"]
      environment_variables = {
        NODE_ENV = "performance"
      }
    }
    prod = {
      lambda_memory_size             = 1024
      reserved_concurrent_executions = 100 # Reserve concurrency for prod
      log_retention_days             = 30
      throttling_burst_limit         = 2000
      throttling_rate_limit          = 500
      cors_allow_origins             = ["https://yourdomain.com"]
      environment_variables = {
        NODE_ENV = "production"
      }
    }
  }

  # Merge defaults with environment-specific overrides for all environments
  all_environments = {
    for env_name, overrides in local.env_overrides :
    env_name => merge(local.default_config, overrides)
  }

  # Filter environments based on selected env_type
  environments = {
    for env_name, config in local.all_environments :
    env_name => config
    if contains(local.env_config_groups[var.env_type], env_name)
  }
}
