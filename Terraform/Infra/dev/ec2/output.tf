output "master_instance_status" {
  description = "Status of the Master instance"
  value       = {
    public_ip = aws_instance.Master.public_ip
    state     = aws_instance.Master.instance_state
  }
}

output "bot1_instance_status" {
  description = "Status of the Bot1 instance"
  value       = {
    public_ip = aws_instance.Bot1.public_ip
    state     = aws_instance.Bot1.instance_state
  }
}

output "bot2_instance_status" {
  description = "Status of the Bot2 instance"
  value       = {
    public_ip = aws_instance.Bot2.public_ip
    state     = aws_instance.Bot2.instance_state
  }
}