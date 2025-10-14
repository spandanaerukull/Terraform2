variable "project" {
default = "roboshop"

}

variable "environment" {
    default = "dev"


}

variable "component" {
    default = "cart"
  
}

#variable "final-name" {
    #default = "${var.project}-${var.environment}-${var.component}"
#}

variable "common_tag" {
  
  default = {
    project = "roboshop"
    terraform = "true"
  }
}