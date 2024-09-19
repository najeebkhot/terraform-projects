resource "aws_vpc_endpoint_route_table_association" "endpoint_rtbl_association" {
  route_table_id  = var.rtbl_id
  vpc_endpoint_id = var.vpc_endpoint_id
}