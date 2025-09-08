
provider "aws" {
  region = "eu-north-1"
}

data "aws_instance" "master_instance" {
  instance_id = "i-06eacbe65379b8178" 
}

data "aws_instance" "bot1_instance" {
  instance_id = "i-04d5a7cf235e958d6" 
}

data "aws_instance" "bot2_instance" {
  instance_id = "i-0ab56c41f1fc8cd59" 
}

output "master_instance_state" {
  description = "The current state of the Master EC2 instance."
  value       = data.aws_instance.master_instance.instance_state
}

output "bot1_instance_state" {
  description = "The current state of the Bot1 EC2 instance."
  value       = data.aws_instance.bot1_instance.instance_state
}

output "bot2_instance_state" {
  description = "The current state of the Bot2 EC2 instance."
  value       = data.aws_instance.bot2_instance.instance_state
}
