# output "subnet_id" {
#     value = var.subnet_id != "" ? var.subnet_id : aws_subnet.subnet[0].id
# }

output "subnet_id" {
    value = aws_subnet.subnet.id
}

output "subnet_ipv6_cidr" {
  value = aws_subnet.subnet.ipv6_cidr_block
}

output "subnet_ipv4_cidr" {
  value = aws_subnet.subnet.cidr_block
}