terraform {
  backend "s3" {
    bucket         = "devops-engineer-assignment-bucket"
    region         = "ap-south-2"
    key            = "app/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}