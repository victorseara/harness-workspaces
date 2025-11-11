# Import existing CloudWatch log groups that were created in previous failed deployments
# This file can be removed after the first successful apply

# API Gateway log groups
import {
  to = module.test2_bff.module.bff["dev"].module.api_gateway.aws_cloudwatch_log_group.api_gateway
  id = "/aws/apigateway/dev-test2-bff-api"
}

import {
  to = module.test2_bff.module.bff["demo"].module.api_gateway.aws_cloudwatch_log_group.api_gateway
  id = "/aws/apigateway/demo-test2-bff-api"
}

import {
  to = module.test2_bff.module.bff["stg"].module.api_gateway.aws_cloudwatch_log_group.api_gateway
  id = "/aws/apigateway/stg-test2-bff-api"
}

import {
  to = module.test2_bff.module.bff["perf"].module.api_gateway.aws_cloudwatch_log_group.api_gateway
  id = "/aws/apigateway/perf-test2-bff-api"
}

# Lambda log groups - these are created by the Lambda module
# Check if these exist in AWS and import if needed
import {
  to = module.test2_bff.module.bff["stg"].module.lambda.module.lambda_function.aws_cloudwatch_log_group.lambda[0]
  id = "/aws/lambda/stg-test2-bff"
}

# Add imports for other Lambda environments if they exist
# Uncomment these if the log groups were created in AWS:
# import {
#   to = module.test2_bff.module.bff["dev"].module.lambda.module.lambda_function.aws_cloudwatch_log_group.lambda[0]
#   id = "/aws/lambda/dev-test2-bff"
# }
#
# import {
#   to = module.test2_bff.module.bff["demo"].module.lambda.module.lambda_function.aws_cloudwatch_log_group.lambda[0]
#   id = "/aws/lambda/demo-test2-bff"
# }
#
# import {
#   to = module.test2_bff.module.bff["perf"].module.lambda.module.lambda_function.aws_cloudwatch_log_group.lambda[0]
#   id = "/aws/lambda/perf-test2-bff"
# }
