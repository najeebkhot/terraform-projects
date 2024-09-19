resource "aws_vpc_endpoint" "endpointS3" {
  vpc_id       = var.aws_vpc_id
  service_name = var.endpoint_service_name
  tags = var.endpoint_name_tag
}