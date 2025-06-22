output "name" {
  description = "Name of Lambda"
  value       = aws_lambda_function.lambda.function_name
}

output "invoke_arn" {
  description = "Invoke ARN of the Lambda"
  value       = aws_lambda_function.lambda.invoke_arn
}
