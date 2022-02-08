terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-gov-west-1"
}

resource "aws_instance" "qlik_replicate" {
  ami           = "ami-008a7a42f9c885956"
  instance_type = "t3.medium"
  subnet_id =  "subnet-0c10df3f9e5866889"
  key_name = "mantech-g2ops-dev"
  security_groups = ["sg-0a4b195f1bc2000a2"]

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

resource "aws_instance" "Linux_TF_Test" {
    ami                         = "ami-008a7a42f9c885956"
    availability_zone           = "us-gov-west-1a"
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "mantech-g2ops-dev"
    subnet_id                   = "subnet-083dafbbabb7bdefd"
    vpc_security_group_ids      = ["sg-094fb2ad73cbcd34d"]
    associate_public_ip_address = false
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 20
        delete_on_termination = true
    }

    tags = {
        Name = "Linux_TF_Test"
        env = "dev"
        poc = "vid.jovanovic"
        task = "terraform_testing"
    }
}

resource "aws_instance" "Windows_TF_Test" {
    ami                         = "ami-0d6fc18bf5f47c93b"
    availability_zone           = "us-gov-west-1a"
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "mantech-g2ops-dev"
    subnet_id                   = "subnet-083dafbbabb7bdefd"
    vpc_security_group_ids      = ["sg-015dbbced21c550d3"]
    associate_public_ip_address = false
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 20
        delete_on_termination = true
    }

    tags = {
        Name = "Windows_TF_Test"
        env = "dev"
        poc = "vid.jovanovic"
        task = "terraform_testing"
    }
}
