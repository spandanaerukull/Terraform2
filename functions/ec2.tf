resource "aws_instance" "Roboshop" {
  count = length(var.instances) #functions syntax 
  ami           = var.ami_id
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allows.id]

  tags = merge(
    var.common_tag,

    {
        component = var.instances[count.index] # here we are using count.index to get the index of the instance in the list
        Name = var.instances[count.index] 
    }
  )
}
    
resource "aws_security_group" "allows" {
name = var.sg_name
description = var.sg_description

ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }


egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }



tags = merge(
     var.common_tag,
     {
        Name = "allow-all"
     }

)
  

}


# functions are used to perform some operations on variables and values
# ex : length() , lower() , upper() , tostring() , tonumber() , merge() , concat() etc
# here we are using length() function to count the number of items in the list
# here we are using merge() function to merge two maps
# here we are using conditional operator to assign instance type based on the environment variable  
# syntax : expression ? "this value if true" : "this will run if false"
# ex : var.environment =="dev" ? "t3.micro" : "t3.small"
# here if environment is dev then instance type will be t3.micro else it will be t3.small
