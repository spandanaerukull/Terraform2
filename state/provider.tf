terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }


  backend "s3" {    #this backend code is used to sotre state file in remote plce like s3 bucket
    bucket = "devops-84"
    key    = "remote-stste-demo"
    region = "us-east-1"
    #dynamodb_table = "terraform-locks"  #locked with dynomodb table old method no one use
    encrypt = true
    use_lockfile = true    # s3 native locking method new we have to lock like this 
  }
}


provider "aws" {
  # Configuration options
}