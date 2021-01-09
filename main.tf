terraform {
  required_version = "= 0.14.4"
  backend "s3" {
    bucket     = "terraform.kenjenney.com"
    key        = "terraform.tfstate"
    region     = "us-east-1"
  }
  required_providers {
    aws = {
      version = "~> 3.23.0"
    }
    random = {
      version = "~> 3.0.0"
    }
    template = {
      version = "~> 2.2.0"
    }
  }
}

resource "aws_dynamodb_table" "terraform_statelock" {
  name           = "terraform"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
