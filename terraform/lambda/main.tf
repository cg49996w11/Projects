terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }

    archive = {
      source  = "hashicorp/archive"
      version = "2.5.0"
    }
  }
  required_version = ">= 1.3.0"
}


module "lambda" {
  source                  = "./modules"
  lambda_function_name    = var.lambda_function_name
  lambda_function_runtime = var.lambda_function_runtime
  source_code_dir_path    = var.source_code_dir_path
  lambda_handler          = var.lambda_handler
  lambda_role_name        = var.lambda_role_name
  lambda_role_policy_name = var.lambda_role_policy_name
  index_directory_path    = var.index_directory_path
  index_file_path         = var.index_file_path
  zip_dir_path            = var.zip_dir_path
  
}