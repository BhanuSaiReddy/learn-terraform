variable "ami" {
  default = "ami-03265a0778a880afb"
}

variable "security_group" {
  default = ["sg-00f89e3d7e55eac8b" ]
}
variable "instance_type" {
  default = "t3.small"
}

variable "zone_id" {
  default = "Z05703682PRJCSXIZAED6"
}

variable "components" {
  default = {
    frontend = {name = "frontend-dev" }
    catalogue  = {name = "catalogue-dev" }
    mangodb = {name = "mangodb-dev" }
    user = {name = "user-dev" }
    redis = {name = "redis-dev" }
    cart = {name = "cart-dev"}
    mysql = {name = "mysql-dev"}
    shipping  = {name = "shipping-dev"}
    payment = {name = "payment-dev"}
    rabbitmq = {name = "rabitmq-dev"}

  }
}
resource "aws_instance" "instance" {
  for_each               = var.components
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group

  tags = {
    Name = each.value.name
  }
}
output"test" {
  value = lookup(var.components, "frontend", "null")
}
#resource "aws_route53_record" "record" {
  #for_each = var.components
  #zone_id = var.zone_id
  #name    = "frontend-dev.devopsbs344.online"
  #type    = "A"
  #ttl     = 30
  #records = lookup(aws_instance.instance, each.key,null)

#}

