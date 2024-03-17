# Variables for Endpoint

variable "endpoint_service_name" {
  type      = string
  default   = "XXXX"
}

variable "aws_vpc_id" {
  type      = string
  default   = "XXXX"
}

variable "endpoint_name_tag" {
  type = map
}