variable "components" {
  default = ["frontend","mangodb"]
}

resource "aws_instance" "instance" {
  count = length(var.components)

  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-00f89e3d7e55eac8b" ]
  tags = {
    #Name = var.components [count.index]
    Name = element (var.components , count.index)
  }
}