locals {
  final_name = "${var.project}-${var.project}-${var.environment}"
  ec2_tags = merge(
    var.common_tag,
    {
        environment = "dev",
        version = "1.0"
    }
  )
}