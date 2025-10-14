resource "aws_route53_record" "www"  {
    count = length(var.instances)
    zone_id = var.zone_id
    name = "${var.instances[count.index]}.${var.domain_name}" #by using this command it will attach rout53 records to created instances ex: mongodb.spandanas.click
    type ="A"
    ttl  = 1
    records = [aws_instance.Roboshop[count.index].private_ip]
  
}