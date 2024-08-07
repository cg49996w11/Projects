variable "lambda_function_name" {
  type        = string
  description = "name of lambda function"
}

variable "lambda_role_name" {
  type        = string
  description = "name of role that lambda function will take"
}

variable "lambda_role_policy_name" {
  type        = string
  description = "name of policy that will be attached to lambda role"
}

variable "lambda_function_runtime" {
  type        = string
  description = "runtime of lambda function"
}

variable "lambda_handler" {
  type        = string
  description = "handler of lambda function"
}

variable "source_code_dir" {
  type        = string
  description = "path of folder where inside which source code is located"
  default     = "source_code"
}
