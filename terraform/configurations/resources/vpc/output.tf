# output "vpc_id" {
#   value = var.vpc_id != "" ? var.vpc_id : aws_vpc.vpc[0].id
# }

output "vpc_cidr_ipv6" {
  value = aws_vpc.vpc[0].ipv6_cidr_block
}

output "vpc_cidr_ipv4" {
  value = aws_vpc.vpc[0].cidr_block
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}