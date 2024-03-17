resource "aws_network_interface" "nic" {
  subnet_id   = var.aws_public_subnet_id
  tags = var.nic_name_tag
}