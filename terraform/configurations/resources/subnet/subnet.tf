resource "aws_subnet" "subnet" {

    availability_zone       = var.subnet_az
    vpc_id                  = var.aws_vpc_id
    cidr_block              = var.subnet_cidr_block
    ipv6_cidr_block         = var.subnet_ipv6_cidr_block
    tags                    = var.subnet_name_tag

}