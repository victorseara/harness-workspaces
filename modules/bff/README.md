# BFF (Backend for Frontend) Module

A high-level Terraform module that creates a complete BFF infrastructure by combining an AWS Lambda function with an API Gateway HTTP API trigger. This module simplifies the deployment of serverless APIs by managing both the compute and API layers together.

## Features

- Creates an AWS Lambda function with configurable runtime, memory, and timeout
- **Automatically zips Lambda source files** - No need to pre-zip your code!
- Provisions an API Gateway HTTP API with default route integration
- Automatically configures Lambda permissions for API Gateway invocation
- Supports CORS configuration
- Configurable IAM roles and policies for Lambda
- Tags support across all resources
- Includes a placeholder Lambda function for initial deployments

## Usage

### Basic Usage (with placeholder)

By default, the module uses the included `lambda-placeholder.js` file:

```hcl
module "my_bff" {
  source = "./harness-workspaces/modules/bff"

  # Lambda Configuration
  function_name = "my-api-function"
  description   = "My API backend function"
  handler       = "lambda-placeholder.handler"
  runtime       = "nodejs20.x"

  # API Gateway Configuration
  api_name = "my-api"

  # Tags
  tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

### Usage with Custom Source Directory

Point to your Lambda source code directory and the module will zip it automatically:

```hcl
module "my_bff" {
  source = "./harness-workspaces/modules/bff"

  # Lambda Configuration
  function_name = "my-api-function"
  description   = "My API backend function"
  handler       = "index.handler"
  runtime       = "nodejs20.x"
  timeout       = 30
  memory_size   = 256

  # Automatically zip files from this directory
  source_dir = "${path.module}/lambda-src"

  environment_variables = {
    ENVIRONMENT = "production"
    API_KEY     = "secret-key"
  }

  # API Gateway Configuration
  api_name        = "my-api"
  api_description = "My BFF API"

  # CORS Configuration
  cors_allow_origins = ["https://example.com"]
  cors_allow_methods = ["GET", "POST", "PUT", "DELETE"]

  # Tags
  tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

## Requirements

- Terraform >= 1.0
- AWS Provider configured
- The harness-iac Lambda and API Gateway modules must be available

## Module Dependencies

This module uses:
- `harness-iac/modules/lambda` - Lambda function configuration
- `harness-iac/modules/api-gateway` - API Gateway HTTP API configuration

## Inputs

### Lambda Configuration

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| function_name | Name of the Lambda function | string | - | yes |
| description | Description of the Lambda function | string | "" | no |
| handler | Lambda function handler | string | "index.handler" | no |
| runtime | Lambda runtime | string | "nodejs20.x" | no |
| timeout | Function timeout in seconds | number | 30 | no |
| memory_size | Memory size in MB | number | 128 | no |
| source_dir | Path to directory containing Lambda source files. If null, uses module directory with lambda-placeholder.js | string | null | no |
| output_path | Path where zip file will be created. If null, creates in .terraform/lambda-package.zip | string | null | no |
| environment_variables | Environment variables for the Lambda function | map(string) | {} | no |
| role_name | Name of the IAM role (defaults to {function_name}-role) | string | null | no |
| custom_policy_json | Custom IAM policy JSON for the Lambda function | string | null | no |
| ignore_source_code_hash | Whether to ignore changes to source code hash | bool | true | no |

### API Gateway Configuration

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| api_name | Name of the API Gateway | string | - | yes |
| api_description | Description of the API Gateway | string | "" | no |
| integration_timeout_ms | Integration timeout in milliseconds (50-30000) | number | 30000 | no |

### CORS Configuration

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| cors_allow_origins | CORS allowed origins | list(string) | ["*"] | no |
| cors_allow_methods | CORS allowed methods | list(string) | ["GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS", "HEAD"] | no |
| cors_allow_headers | CORS allowed headers | list(string) | ["*"] | no |
| cors_expose_headers | CORS exposed headers | list(string) | [] | no |
| cors_max_age | CORS max age in seconds | number | 300 | no |
| cors_allow_credentials | Whether to allow credentials in CORS | bool | false | no |

### Shared Configuration

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| tags | Tags to apply to all resources | map(string) | {} | no |

## Outputs

### Lambda Outputs

| Name | Description |
|------|-------------|
| lambda_function_name | Name of the Lambda function |
| lambda_function_arn | ARN of the Lambda function |
| lambda_invoke_arn | Invoke ARN of the Lambda function |
| lambda_role_arn | ARN of the Lambda IAM role |
| lambda_role_name | Name of the Lambda IAM role |
| lambda_qualified_arn | Qualified ARN of the Lambda function |
| lambda_version | Latest published version of the Lambda function |

### API Gateway Outputs

| Name | Description |
|------|-------------|
| api_id | ID of the API Gateway |
| api_endpoint | Endpoint URL of the API Gateway |
| api_execution_arn | Execution ARN of the API Gateway |
| api_invoke_url | Invoke URL of the API Gateway default stage |
| api_stage_id | ID of the API Gateway default stage |
| api_stage_execution_arn | Execution ARN of the API Gateway default stage |

## How It Works

1. **Zipping**: The module uses the `archive_file` data source to automatically zip your Lambda source files
   - By default, it zips the `lambda-placeholder.js` file from the module directory
   - You can specify a custom `source_dir` to zip your own Lambda code
   - The zip file is created at `output_path` (default: `.terraform/lambda-package.zip`)
2. **Lambda Creation**: Creates a Lambda function using the Lambda module from `harness-iac/modules/lambda`
3. **API Gateway**: Creates an API Gateway HTTP API using the API Gateway module from `harness-iac/modules/api-gateway`
4. **Integration**: The API Gateway is configured with a default route (`$default`) that integrates with the Lambda function
5. **Permissions**: Lambda permissions are automatically configured to allow API Gateway to invoke the function
6. **Tagging**: All resources are tagged with the provided tags

## Notes

- **No pre-zipping required!** The module automatically creates the Lambda deployment package from your source files
- The placeholder Lambda function (`lambda-placeholder.js`) is included for initial infrastructure deployment
- Set `ignore_source_code_hash = true` (default) when Lambda deployments are handled outside of Terraform
- The API Gateway uses HTTP API (v2) with payload format version 2.0
- CORS is configured at the API Gateway level for all routes
- The archive provider automatically tracks changes to source files and triggers redeployment when they change
- If you're managing Lambda code deployments separately (e.g., via CI/CD), set `ignore_source_code_hash = true` to prevent Terraform from managing code updates
