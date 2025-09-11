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
  region = var.region
  profile = "default"
}