resource "aws_subnet" "subnet" {
    availability_zone = var.subnet_az
    #availability_zone_id = var.subnet_az_id
    vpc_id     = var.aws_vpc_id
    cidr_block = var.subnet_cidr_block
    tags = var.subnet_name_tag
}

# resource "aws_subnet" "public_subnet2" {
#     availability_zone = var.pub_sub2_az
#     #availability_zone_id = var.pub_sub2_az_id
#     vpc_id     = var.aws_vpc_id
#     cidr_block = var.pub_sub2_cidr_block
#     tags = var.pub_sub2_name_tag
# }

# resource "aws_subnet" "private_subnet1" {
#     availability_zone = var.priv_sub1_az
#     #availability_zone_id = var.priv_sub1_az_id
#     vpc_id     = var.aws_vpc_id
#     cidr_block = var.priv_sub1_cidr_block
#     tags = var.priv_sub1_name_tag
# }

# resource "aws_subnet" "private_subnet2" {
#     availability_zone = var.priv_sub2_az
#     #availability_zone_id = var.priv_sub2_az_id
#     vpc_id     = var.aws_vpc_id
#     cidr_block = var.priv_sub2_cidr_block
#     tags = var.priv_sub2_name_tag
# }