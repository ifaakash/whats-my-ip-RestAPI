variable "function_name" {
  type        = string
  description = "Name of the lambda function"
  default     = "whats-my-ip"
}

variable "description" {
  type        = string
  description = "Description of Lambda function"
  default     = "Lambda function to display timestamp and IP of the User"
}

variable "package_type" {
  type        = string
  description = "Compression type for the source code file"
  default     = "Zip"
}

variable "runtime_env" {
  type        = string
  description = "Runtime environment for application code"
  default     = "python3.12"
}

variable "bucket_name" {
  type        = string
  description = "Name of the S3 Bucket storing application"
  default     = "iaclambda"
}

variable "s3_key" {
  type        = string
  description = "Name of the .zip file"
  default     = "restapp.zip"
}

variable "handler" {
  type        = string
  description = "Handler function in the python file"
  default     = "restapp.lambda_handler"
}

variable "lambda_exec_role_arn" {
  type        = string
  description = "ARN of the IAM role for Lambda execution"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resoruces"
  default = {
    "Project" = "POC"
  }
}
