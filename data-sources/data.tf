data "aws_ami" "joindevops"{ # data source to get the ami id of joindevops rhel9
    filter {  # filter is used to filter the ami based on the name
      name = "name"  # filter name
    values = ["RHEL-9-Devops-practice"]  # filter value

    }

    
  
}

output "ami_id" { # to get the ami id from the data source
    value  = data.aws_ami.joindevops.id # it will give the ami id of the above filtered data source
}