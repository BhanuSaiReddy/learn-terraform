# main.tf
provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

resource "aws_instance" "whatsapp_notifier" {
  ami           = "ami-03265a0778a880afb"  # Your desired AMI
  instance_type = "t3.micro"  # Your desired instance type

  # Add other necessary configurations (security groups, key pair, etc.)
}


ami           = "ami-03265a0778a880afb"
instance_type = "t3.small"
vpc_security_group_ids = [ "sg-00f89e3d7e55eac8b" ]

resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"