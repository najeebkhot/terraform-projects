resource "aws_internet_gateway_attachment" "igw_association" {
  internet_gateway_id = var.aws_igw_id
  vpc_id              = var.aws_vpc_id
}