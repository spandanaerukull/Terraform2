
resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id] # here id means it will take or fetch  the created security group id 

  tags = var.ec2_tags
}


resource "aws_security_group" "allow_all" { # mentioned the name of the resources
     name        = var.sg_name
  description = var.sg_description

  tags = var.sg_tags    # here tags is nothing but key = value pair (just for information ) this security group tags

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1" # -1 means it is equelant to all if you give from port 80,443 then give tcp at protocol
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

}
