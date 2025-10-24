


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0" 
    }
  }
}

provider "aws" {
  # Configuration options
}

# firsting in terraform before creating the infrastructure
# provider is used to connect aws, gcp, auzure ,etc ...
# after provider we have to do aws configurations in gitbash 