resource "aws_route_table_association" "rtbl-subnet-association" {
  subnet_id      = var.subnet_id
  route_table_id = var.rtbl_id
}