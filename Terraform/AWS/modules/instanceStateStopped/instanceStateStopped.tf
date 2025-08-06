provider "aws" {
  region = "eu-north-1" # Make sure this matches your region
}

resource "aws_ec2_instance_state" "master_stopped" {
  instance_id = "i-06eacbe65379b8178" # REPLACE with your Master instance ID
  state       = "stopped"
}

resource "aws_ec2_instance_state" "bot1_stopped" {
  instance_id = "i-04d5a7cf235e958d6" # REPLACE with your Bot1 instance ID
  state       = "stopped"
}

resource "aws_ec2_instance_state" "bot2_stopped" {
  instance_id = "i-0ab56c41f1fc8cd59" # REPLACE with your Bot3 instance ID
  state       = "stopped"
}

output "master_status_after_stopped" {
  description = "Current state of Master instance after applying stopped config"
  value       = aws_ec2_instance_state.master_stopped.state
}

output "bot1_status_after_stopped" {
  description = "Current state of Bot1 instance after applying stopped config"
  value       = aws_ec2_instance_state.bot1_stopped.state
}

output "bot2_status_after_stopped" {
  description = "Current state of Bot2 instance after applying stopped config"
  value       = aws_ec2_instance_state.bot2_stopped.state
}
