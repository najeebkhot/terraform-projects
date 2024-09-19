resource "aws_instance" "ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = var.subnet_id
  tags          = var.ec2_name_tag
}


variable "ami_name" {
  type = string
}