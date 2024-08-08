data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = var.lambda_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}


resource "aws_iam_policy" "iam_policy_for_lambda" {
  name        = var.lambda_role_policy_name
  path        = "/"
  description = "AWS IAM Policy for managing aws lambda role"
  policy      = file("${path.root}/policy.json")
}


resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
}


data "archive_file" "source_code_zip" {
  type        = "zip"
  source_dir  = var.zip_dir_path
  output_path = "${path.module}/app.zip"
  depends_on = [terraform_data.build]
}

resource "aws_lambda_function" "terraform_lambda_func" {
  filename         = "${path.module}/app.zip"
  function_name    = var.lambda_function_name
  role             = aws_iam_role.iam_for_lambda.arn
  runtime          = var.lambda_function_runtime
  handler          = var.lambda_handler
  source_code_hash = data.archive_file.source_code_zip.output_base64sha256
  depends_on       = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role, data.archive_file.source_code_zip]
}

resource "terraform_data" "build" {
  triggers_replace = [
    # "${timestamp()}"
    local.lambda_md5
  ]
 
  provisioner "local-exec" {
    command     = "npm run build"
    working_dir = var.index_directory_path
  }
}

locals {
  lambda_md5 = filemd5(var.index_file_path)
}