resource "aws_instance" "Master" {
  ami           = "ami-04542995864e26699" 
  instance_type  = "t3.micro"
  subnet_id      = "subnet-051045c38e58868a0" 
  vpc_security_group_ids = ["sg-040c1e25cf3fd034b"]
  key_name      = "Tutorial"
  tags = {
    Name = "DevOps-Master"
  }
}

resource "aws_instance" "Bot1" {
  ami           = "ami-04542995864e26699" 
  instance_type  = "t3.micro"
  subnet_id      = "subnet-051045c38e58868a0" 
  vpc_security_group_ids = ["sg-040c1e25cf3fd034b"]
  key_name      = "Tutorial"
  tags = {
    Name = "Database"
  }
}

resource "aws_instance" "Bot2" {
  ami           = "ami-04542995864e26699" 
  instance_type  = "t3.micro"
  subnet_id      = "subnet-051045c38e58868a0" 
  vpc_security_group_ids = ["sg-040c1e25cf3fd034b"]
  key_name      = "Tutorial"
  tags = {
    Name = "WebServers"
  }
}

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