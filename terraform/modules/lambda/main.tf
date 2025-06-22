resource "aws_lambda_function" "lambda" {
  function_name = var.function_name
  role          = var.lambda_exec_role_arn
  description   = var.description
  s3_bucket     = "iaclambda"   # S3 bucket which has .zip file of application
  s3_key        = "restapp.zip" # Name of the .zip file
  package_type  = var.package_type
  handler       = var.handler # <python_file_name.lambda_function_name>
  runtime       = var.runtime_env
  tags          = var.tags
}
