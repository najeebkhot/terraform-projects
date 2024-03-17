resource "aws_instance" "ec2" {
  ami           = var.ec2_ami
  instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
  }

  tags = {
    Name = "webserver01"
  }
}
