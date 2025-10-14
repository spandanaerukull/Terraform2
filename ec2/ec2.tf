
resource "aws_instance" "roboshop" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  # vpc_security_group_ids = [aws_security_group.allow_all.id] # here id means it will take or fetch  the created security group id 
    vpc_security_group_ids = local.sg_id # using local variable
  tags = {  # this is instance tags 
    Name = "helloworld"
  }
}


resource "aws_security_group" "allow_all" { # mentioned the name of the resources
     name        = "allow_all"
  description = "Allow all the traffic"

  tags = {    # here tags is nothing but key = value pair (just for information ) this security group tags
    Name = "allow_all"
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # -1 means it is equelant to all if you give from port 80,443 then give tcp at protocol
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
