data "terraform_remote_state" "vpc" {
    backend = "local"
    config = {
      path = "../vpc/terraform.tfstate"
    }
}

data "terraform_remote_state" "subnet_id" {
    backend = "local"
    config = {
      path = "../subnet/terraform.tfstate"
    }
}