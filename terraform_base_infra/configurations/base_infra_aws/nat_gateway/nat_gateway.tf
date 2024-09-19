resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = var.aws_elastic_ip_id
  subnet_id     = var.subnet_id

  tags = var.nat_gw_name_tag

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  # depends_on = [aws_internet_gateway.example]
}