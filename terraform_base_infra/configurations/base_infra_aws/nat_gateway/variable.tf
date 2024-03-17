# Variables for Nat Gateway

variable "aws_elastic_ip_id" {
  type      = string
  default   = "XXXX"
}

variable "subnet_id" {
  type      = string
  default   = "XXXX"
}

variable "nat_gw_name_tag" {
  type = map
}