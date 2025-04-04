# Lambda オーソライザー関数
resource "aws_lambda_function" "authorizer" {
  function_name = "api_gateway_authorizer"
  filename      = "lambda_authorizer.zip" # Python コードを含む ZIP ファイル
  handler       = "main.handler"
  role          = aws_iam_role.lambda_authorizer_role.arn
  runtime       = "python3.11" # Python ランタイムに変更

  environment {
    variables = {
      AUTH_SECRET = "your-auth-secret" # 環境変数は必要に応じて設定してください
    }
  }
}

# 保護されたエンドポイント用の Lambda 関数
resource "aws_lambda_function" "protected_endpoint" {
  function_name = "protected_endpoint"
  filename      = "protected_endpoint.zip" # Python コードを含む ZIP ファイル
  handler       = "main.handler"
  role          = aws_iam_role.lambda_authorizer_role.arn
  runtime       = "python3.11" # Python ランタイムに変更
}
