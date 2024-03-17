resource "aws_eip" "elastic_ip" {
  #vpc = var.elastic_ip_vpc
  domain = var.elastic_ip_domain
}