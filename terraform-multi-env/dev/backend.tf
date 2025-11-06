 
        
    
    terraform {
      backend "s3" {
        bucket         = "84-remote-state-dev"
        key            = "tfvars-demo"
        region         = "us-east-1"
        encrypt        = true
        use_lockfile   = true
      }
    }
  



  