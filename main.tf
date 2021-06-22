terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# resource "aws_s3_bucket" "terraform-state-storage-s3" {
#     bucket = "terraform-remote-state-storage-s3-smst"
 
#     versioning {
#       enabled = true
#     }
 
#     lifecycle {
#       prevent_destroy = true
#     }
 
#     tags =  {
#       Name = "S3-Remote-Terraform-State-Store-smst"
#     }      
# }
# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo-smst"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags =  {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-remote-state-storage-s3-smst"
    key    = "statefiles"
    region = "us-gov-east-1"
    //dynamodb_table = "terraform-state-lock-dynamo-smst"
  }
}
