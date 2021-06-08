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

resource "aws_instance" "qlik_replicate" {
  ami           = "ami-0bbf3595bb2fb39ec"
  instance_type = "t3.medium"
  subnet_id =  "subnet-0ab643787de239342"
  key_name = "qlik_west"
  security_groups = ["sg-039f2d81b207cb7da"]

  tags = {
    Name = "Attunity-replicate"
    Auto-StartStop-Enabled = "true"
    Environment = "Test"
    Poc = "florence.vinyo@manteh.com"
  }
}
output "instance_ip_addr" {
  value = aws_instance.qlik_replicate.private_ip
}
