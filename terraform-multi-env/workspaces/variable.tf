variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "AMI ID of joindevops RHEL9"
}



variable "project" {
  default = "roboshop"
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

variable "common_tag" {
  default = {
   project = "roboshop"
   terraform = "true"
  }
}

variable "sg_name" {
  default = "allow-all"
}

variable "sg_description" {
  default = "allowing all ports from all ip"
}

variable "instances" {
  default = ["mongodb","redis"]
}

variable "instance_type" {
    default = {
        dev = "t3.micro"
        prod = "t3.small"
    }

  
}


