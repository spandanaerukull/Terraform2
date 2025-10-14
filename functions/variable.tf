variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "AMI ID of joindevops RHEL9"

}

variable "instance_type" {
  default = "t3.micro"

}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name    = "Roboshop"
    purpose = "variables-demo"

  }
}

variable "sg_name" {
  default = "allow-all"

}

variable "sg_description" {
  default = "allowing all ports from internet"

}

variable "from_port" {
  default = 0
}

variable "to_port" {
  type    = number
  default = 0
}

variable "cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    Name = "allows"
  }
}


variable "environment" {

  default = "dev"
}


variable "instances" {
  default = ["mongodb" , "redis" , "mysql", "rabbitmq"] # when we are using functions syntax we have to give instance variable like this
    
}

variable "zone_id" {
  default = "Z0814915TW9IOIAFJ3HM"

}

variable "domain_name" {
  default = "spandanas.click"

}


variable "ingress_ports" {
  default = [
    {
      from_port = 22
      to_port   = 22
    },
    {
      from_port = 80
      to_port   = 80
    },
    {
      from_port = 8080
      to_port   = 8080
    },

  ]

}

variable "common_tag" {
  default = {
    project ="roboshop"
    terraform = "true"
  }
}