resource "aws_iam_policy" "custom_policy" {
  name        = var.policy_name
  description = "Custom IAM policy for demonstration"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "*"
      }
    ]
  })
}