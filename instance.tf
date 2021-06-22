terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-gov-west-1"
}

resource "aws_instance" "nprinting" {
  ami           = "ami-0de2cf70c88e410e4"
  instance_type = "t3.medium"
  subnet_id =  "subnet-0ab643787de239342"
  key_name = "qlik_west"
  security_groups = ["sg-0c6c83b593c0d9f1b"]

  tags = {
    Name = "nprinting"
    Auto-StartStop-Enabled = "true"
    Environment = "Test"
    Poc = "florence.vinyo@manteh.com"
  }
}
output "instance_ip_addr" {
  value = aws_instance.qlik_nprinting.private_ip
}
