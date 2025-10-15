resource "aws_instance" "Roboshop" {
  ami           = var.ami_id      
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allows.id]

  tags = var.ec2_tags

provisioner "local-exec" { # this provisioner is used to perform a task in local machine
    command = "echo ${self.private_ip} > inventory" # here we are getting private ip of the created instance and storing in inventory file
    on_failure =  continue  # by using this command, if we get error it will ignorinig errors.
  #provisioners local command is used to perform a task in local machine ex: here is used command for get private ip in local machine and its created in inventory and there it gave my private ip
  }
  provisioner "local-exec" {
    command = "echo 'instance is destroyed'"
    when = destroy # when we destroy the instance it will print the message in local machine

  }

  #    connection {
  #      type = "ssh"
  #      user = "ec2-user"
  #      password = "DevOps321"
  #      host = self.public_ip
  #    }

  #    provisioner "remote-exec" {
  #      inline = [
  #       "sudo dnf install nginx -y",
#         "sudo systemctl start nginx",

#        ]
#      }

#      provisioner "remote-exec" {
#         when = destroy
#        inline = [
#         "sudo systemctl stop nginx"
        

#        ]


#      }

}

resource "aws_security_group" "allows" {
  name        = var.sg_name
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

  tags = var.sg_tags
}