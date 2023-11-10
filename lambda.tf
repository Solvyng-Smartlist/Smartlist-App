# Define the AWS provider configuration
provider "aws" {
  region = "ap-south-1" # Set your desired region
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "lambda.py"
  output_path = "lambda.zip"
}

# Create an AWS Lambda function
//================lambda code======================
resource "aws_lambda_function" "smartlist_lambda" {
  function_name = "smartlist_lambda_function"
  handler      = "index.handler"
  runtime      = "python3.9" 
  filename     = data.archive_file.lambda_zip.output_path
  source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)

  role = aws_iam_role.iam_lambda_role.arn

 
}

# Define an IAM role for the Lambda function
//================iam role===================
resource "aws_iam_role" "iam_lambda_role" {
  name = "iam_lambda_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Create a DynamoDB table
resource "aws_dynamodb_table" "smartlistdynamo2023-dev" {
  name           = "smartlistdynamo2023-devs"
  billing_mode   = "PROVISIONED"
  hash_key       = "ID"
  read_capacity  = 5
  write_capacity = 5
  attribute {
    name = "ID"
    type = "S"
  }
}