terraform {
  backend "s3" {
    bucket         = "cc-belajar-devops"
    key            = "infra/dev/ap-southeast-1/terraform.tfstate"
    dynamodb_table = "cc-belajar-devops-tfstate-lock"
    region         = "ap-southeast-1"
  }
}