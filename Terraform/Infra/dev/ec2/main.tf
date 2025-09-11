resource "aws_instance" "Master" {
  ami           = var.ami
  instance_type  = var.instance_type
  subnet_id      = data.terraform_remote_state.subnet_id.outputs.subnet_id 
  vpc_security_group_ids = data.terraform_remote_state.vpc.outputs.vpc_id
  key_name      = var.key_name
  tags = {
    Name = "DevOps-Master"
  }
}

resource "aws_instance" "Bot1" {
  ami           = var.ami 
  instance_type  = var.instance_type
  subnet_id      = data.terraform_remote_state.subnet_id.outputs.subnet_id  
  vpc_security_group_ids = data.terraform_remote_state.vpc.outputs.vpc_id
  key_name      = var.key_name
  tags = {
    Name = "Database"
  }
}

resource "aws_instance" "Bot2" {
  ami           = var.ami 
  instance_type  = var.instance_type
  subnet_id      = data.terraform_remote_state.subnet_id.outputs.subnet_id  
  vpc_security_group_ids = data.terraform_remote_state.vpc.outputs.vpc_id
  key_name      = var.key_name
  tags = {
    Name = "WebServers"
  }
}