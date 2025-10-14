variable "ami_id" {  # variable name 
  type = string      # type of the data contained in the variable 
  default = "ami-09c813fb71547fc4f"       # the default value
  description = "AMI ID of joindevops RHEL9"
}

variable "instance_type" {
    default = "t3.micro"
  
}

variable "ec2_tags" {
    type = map(string)
  default = {
Name = "spandu"
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
    type = number
  default = 0
}

variable "to_port" {
    type = number
  default = 0
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    Name = "allows"
  }
}
