terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {    
                      #the backend code is written dev,backend.tf & production.tf because i created 2 different buckets i want seperate state files 
  }
}

provider "aws" {
  # Configuration options
}