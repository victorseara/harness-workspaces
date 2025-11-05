/**
 * A placeholder AWS Lambda function.
 * This function is used by OpenTofu as a stand-in for actual Lambda functions when deploying infrastructure.
 * The actual function code is implemented elsewhere and deployed separately. 
*/
exports.handler = async (event) => {
  console.log('event', event);
  return {
    statusCode: 200,
    body: JSON.stringify({ message: 'Hello from placeholder!' }),
  };
};
