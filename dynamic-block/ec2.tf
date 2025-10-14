resource "aws_instance" "Roboshop" {
  for_each               = var.instances # dynamic block # here we are using for_each because we are using map data type
  ami                    = var.ami_id
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allows.id]

  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "allows" {
  name        = var.sg_name
  description = var.sg_description

  dynamic "ingress" {
    for_each = var.ingress_ports # here we are using dynamic block because we have to create multiple ingress blocks based on the requirement
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = "-1"
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    }

  }


  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }



  tags = var.sg_tags


}

# dynamic block is used when we have to create multiple blocks of same type based on the requirement
# ex : ingress block in security group





  