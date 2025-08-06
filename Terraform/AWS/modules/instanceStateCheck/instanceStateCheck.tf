# Configure the AWS provider
provider "aws" {
  region = "eu-north-1" # Make sure this matches the region where your instances are located
}

# Data source for the Master EC2 instance
# This block reads the current details of the instance with the given ID.
data "aws_instance" "master_instance" {
  instance_id = "i-06eacbe65379b8178" # <<< REPLACE with your Master instance ID >>>
}

# Data source for the Bot1 EC2 instance
# This block reads the current details of the instance with the given ID.
data "aws_instance" "bot1_instance" {
  instance_id = "i-04d5a7cf235e958d6" # <<< REPLACE with your Bot1 instance ID >>>
}

# Data source for the Bot2 EC2 instance
# This block reads the current details of the instance with the given ID.
data "aws_instance" "bot2_instance" {
  instance_id = "i-0ab56c41f1fc8cd59" # <<< REPLACE with your Bot2 instance ID >>>
}

# Output the state of the Master instance
# This output will show the current state (e.g., "running", "stopped")
# of the Master EC2 instance after 'terraform plan'.
output "master_instance_state" {
  description = "The current state of the Master EC2 instance."
  value       = data.aws_instance.master_instance.instance_state
}

# Output the state of the Bot1 instance
# This output will show the current state of the Bot1 EC2 instance.
output "bot1_instance_state" {
  description = "The current state of the Bot1 EC2 instance."
  value       = data.aws_instance.bot1_instance.instance_state
}

# Output the state of the Bot2 instance
# This output will show the current state of the Bot2 EC2 instance.
output "bot2_instance_state" {
  description = "The current state of the Bot2 EC2 instance."
  value       = data.aws_instance.bot2_instance.instance_state
}
