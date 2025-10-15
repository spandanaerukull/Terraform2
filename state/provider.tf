terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }


  backend "s3" {    #this backend code is used to sotre state file in remote plce like s3 bucket
    bucket = "86-practicebucket" # give your bucket name here
    key    = "remote-state-demo" # give any name to identify your state file 
    region = "us-east-1"
    #dynamodb_table = "terraform-locks"  #locked with dynomodb table old method no one use
    encrypt = true # encrypt the state file
    use_lockfile = true    # s3 native locking method new we have to lock like this 
  }
}


provider "aws" {
  # Configuration options

}

# we should always give different keys to different projects in the same bucket
# if we do any changes in the provider we have to do the reconfigure