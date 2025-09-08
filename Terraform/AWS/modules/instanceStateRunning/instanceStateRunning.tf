provider "aws" {
  region = "eu-north-1"
}

resource "aws_ec2_instance_state" "master_status" {
  instance_id = "i-06eacbe65379b8178"
  state       = "running"
}

resource "aws_ec2_instance_state" "bot1_status" {
  instance_id = "i-04d5a7cf235e958d6"
  state       = "running"
}

resource "aws_ec2_instance_state" "bot2_status" {
  instance_id = "i-0ab56c41f1fc8cd59"
  state       = "running"
}

output "master_status_after_running" {
  description = "Current state of Master instance after applying running config"
  value       = aws_ec2_instance_state.master_status.state
}

output "bot1_status_after_running" {
  description = "Current state of Bot1 instance after applying running config"
  value       = aws_ec2_instance_state.bot1_status.state
}

output "bot2_status_after_running" {
  description = "Current state of Bot2 instance after applying running config"
  value       = aws_ec2_instance_state.bot2_status.state
}