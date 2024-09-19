# Variables for Subnets

variable "subnet_az" {
  type      = string
  default   = "XXXX"
}

variable "subnet_cidr_block" {
  type      = string
  default   = "XXXX"
}

variable "subnet_ipv6_cidr_block" {
  type      = string
  default   = "XXXX"
}

variable "subnet_name_tag" {
  type = map
}

variable "aws_vpc_id" {
  type      = string
  default   = "XXXX"
}

# variable "subnet_id" {
#   type        = string
#   description = "Enter the Subnet ID"
# }