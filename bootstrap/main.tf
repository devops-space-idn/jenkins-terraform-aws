resource "aws_s3_bucket" "bucket" {
  bucket = "cc-belajar-devops"
}

resource "aws_dynamodb_table" "terraform-lock" {
  name           = "cc-belajar-devops-tfstate-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform state lock table"
  }
}