# Variables for EC2

# variable "aws_public_subnet_id" {
#     type      = string
#     default   = "XXXX"
# }

variable "nic_name_tag" {
  type = map
}

variable "subnet_id" {
  type = string
}