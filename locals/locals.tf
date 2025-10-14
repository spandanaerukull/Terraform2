locals {
    final_name = "${var.project}-${var.environment}-${var.component}" #gving expressions like this is a interpolation syntax
    ec2_tags = merge(  #functions
     var.common_tag,
     {
        environment = "dev"
        version = "1.0"
     }       

    )


}


#locals  is used for getting output get particular information about project 
#example output is : final_name = "roboshop-dev-cart"


# in locals we can assign functins and expressions to name and you can use it wher ever you want 
#We cannot over ridden in the local, which we can't do the over rides, for that we use locals 
# variable can be overriden, locals can't be overriden

#this syntax i used in ec22 block at security group in terraform 
#just see how it works 
#we should not use locals in side syntax just use local 

# local values are unchangeable like constants
# Local values in Terraform are unchangeable (read-only) after they are set. You define them once, and their value stays the same throughout the module.