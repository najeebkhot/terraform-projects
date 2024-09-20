resource "aws_route_table" "rtbl" {
  vpc_id = var.aws_vpc_id
  tags = var.rtbl_name_tag
}
