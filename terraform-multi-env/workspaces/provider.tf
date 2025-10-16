terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }


    backend "s3" {
        bucket         = "devops-84"
        key            = "testing/workspaces"
        region         = "us-east-1"
        encrypt        = true
        use_lockfile   = true
    
  }
}

provider "aws" {
  # Configuration options
}

# we should always give different keys to different projects in the same bucket
# if we do any changes in the provider we have to do the reconfigure
# terraform init -reconfigure
# terraform workspace means we can create multiple enviornments in the same code
# terraform workspace new dev
# terraform workspace new prod
# terraform workspace list
