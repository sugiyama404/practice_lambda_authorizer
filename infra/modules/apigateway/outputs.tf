output "apigatewayv2_api_http_api_execution_arn" {
  value = aws_apigatewayv2_api.http_api.execution_arn
}

output "apigatewayv2_authorizer_lambda_authorizer_id" {
  value = aws_apigatewayv2_authorizer.lambda_authorizer.id
}
