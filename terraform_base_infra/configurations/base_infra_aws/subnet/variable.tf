# Variables for Subnets

variable "subnet_az" {
  type      = string
  default   = "XXXX"
}

variable "subnet_cidr_block" {
  type      = string
  default   = "XXXX"
}

# variable "subnet_az_id" {
#   type      = string
#   default   = "XXXX"
# }

variable "subnet_name_tag" {
  type = map
}

variable "aws_vpc_id" {
  type      = string
  default   = "XXXX"
}