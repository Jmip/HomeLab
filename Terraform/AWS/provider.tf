terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider and access using a profile
provider "aws" {
  region = "eu-north-1"
  profile = "default" # Replace "default" with your AWS CLI profile name if different
}