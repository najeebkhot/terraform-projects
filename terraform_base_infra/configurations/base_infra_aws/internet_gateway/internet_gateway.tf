resource "aws_internet_gateway" "igw" {
  vpc_id = var.aws_vpc_id
  tags = var.igw_name_tag
}