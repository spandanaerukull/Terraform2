resource "aws_route53_record" "www"  {
    for_each = aws_instance.Roboshop
    zone_id = var.zone_id
    name = "${each.key}.${var.domain_name}" #by using this command it will attach rout53 records to created instances ex: mongodb.spandanas.click
    type ="A"
    ttl  = 1
    records = [each.value.private_ip]
  
}