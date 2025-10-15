resource "aws_instance" "Roboshop" {
    count = length(var.instances)
  ami           = var.ami_id      # this is from loops concept by using count , by giving count=4 wecan creat 4 instance , we can can creat number of instance that we want 
   instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allows.id]

  tags = merge(
    var.common_tag,
    {
        Name = "${var.project}-${var.instances[count.index]}-${var.environment}"
        component = var.instances[count.index]
        Environment = var.environment
    }
  )
}


resource "aws_security_group" "allows" {
name = "${var.project}-${var.sg_name}-${var.environment}" # sg_name=allow-all- env=dev output of this line
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
        Name = "${var.project}-${var.sg_name}-${var.environment}"            #varsg_name-=robosho env=terraform output
    }
)
  

}



