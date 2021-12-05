/*

resource "aws_iam_role" "lambda_role" { //role voor lambda function maken
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}




resource "aws_lambda_function" "ip_getter" {
  filename = "../dieltiens_files/lambda_function.zip"
  function_name = "labmda_taak_cloud"
  role = aws_iam_role.lambda_role.arn
  handler = "lambda.lambda_handler" //wat doet dit ???

  runtime = "python3.8"
}
*/