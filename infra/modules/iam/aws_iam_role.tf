resource "aws_iam_role" "app_runner_service_role" {
  name = "app-runner-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "build.apprunner.amazonaws.com"
        }
      }
    ]
  })
  tags = {
    Name = "${var.app_name}-lambda-iam-role"
  }
}
