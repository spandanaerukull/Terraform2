

resource "aws_route53_record" "www"  {
    count = 4
    zone_id = var.zone_id
    name = "${var.instances[count.index]}.${var.domain_name}" #by using this command it will attach rout53 records to created instances ex: mongodb.spandanas.click
    type ="A"
    ttl  = 1 #time to live
    records = [aws_instance.roboshop[count.index].private_ip] # here we are using private ip because we are using vpc and private subnet
}

# interpolation is nothing but combining variables and strings
# ex : ${var.instances[count.index]}.${var.domain_name}  it will create records like mongodb.spandanas.click
# here we are using count.index to create multiple records by using for each instance in the list   
# we can use count.index only when we are using count attribute
# if we use for_each we have to use each.key or each.value based on the data type
# here we are using count because we are creating multiple instances and multiple records   
# zone_id is nothing but hosted zone id which we can get from route53
# name is nothing but the domain name which we are creating