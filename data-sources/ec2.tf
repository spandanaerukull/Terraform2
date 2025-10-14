resource "aws_instance" "Roboshop" {
  ami           = data.aws_ami.joindevops.id   # this is used for getting the latest version of ami
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allows.id]

  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_security_group" "allows" {
name = "allows"
description = "allow all the traffic"

ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
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



tags = {
    Name = "allows"
  }

}