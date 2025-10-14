variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "AMI ID of joindevops RHEL9"
  
}

variable "instance_type" {
    default = "t3.micro"
  
}

variable "ec2_tags" {
    type = map(string)
  default = {
Name = "Roboshop"
purpose = "variables-demo"

  }
}

variable "sg_name" {
    default = "vars-file-aiiow-all"
  
}

variable "sg_description" {
    default = "allowing all ports from internet"
  
}

variable "from_port" {
  default = 0
}

variable "to_port" {
    type = number
  default = 0
}

variable "cidr_blocks" {
  type = list
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    Name = "allows"
  }
}


variable "environment" {
  
  default =  "dev"
}


variable "instances" {
default = {
       mongodb = "t3.micro"
       redis = "t3.micro"
       mysql = "t3.small"   #each keyword is assigned for every iteration .so wil  get each.key, and each.value
       rabbitmq = "t3.micro"

}

  
}

variable "zone_id" {
default = "Z0814915TW9IOIAFJ3HM"

}

variable "domain_name" {
  default = "spandanas.click"

}