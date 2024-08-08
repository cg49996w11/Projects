variable "lambda_function_name" {
  type        = string
  description = "name of lambda function"
}

variable "lambda_handler" {
  type        = string
  description = "handler of lambda function"
}

variable "lambda_function_runtime" {
  type        = string
  description = "runtime of lambda function"
}

variable "lambda_role_name" {
  type        = string
  description = "name of role that lambda function will take"
}

variable "lambda_role_policy_name" {
  type        = string
  description = "name of policy that will be attached to lambda role"
}

variable "source_code_dir_path" {
  type        = string
  description = "root folder  inside which source code is located"
  default     = "source_code"
}

variable "zip_dir_path" {
  type        = string
  description = "path of folder in which all files need to be zipped"
  default     = "source_code/src/dist"
}

variable "index_file_path" {
  type        = string
  description = "the path to file that contains lambda code that needs to be executed"
  default     = "source_code/src/index.ts"
}

variable "index_directory_path" {
  type        = string
  description = "the path to folder that contains lambda code that needs to be executed"
  default     = "source_code/src"
}
