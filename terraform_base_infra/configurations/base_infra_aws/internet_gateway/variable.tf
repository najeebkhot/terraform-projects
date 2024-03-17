# Variables for Internet Gateway Table
variable "aws_vpc_id" {
  type      = string
  default   = "XXXX"
}

variable "igw_name_tag" {
  type = map
}