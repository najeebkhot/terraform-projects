module "public_subnet_1" {
    source = "git@github.com:najeebkhot/terraform-modules?ref=modules/infra"

    aws_vpc_id = var.vpc_id
    subnet_az = var.subnet_az
    subnet_cidr_block = var.cidr_block
    subnet_name_tag = {
        Name    =   "my-demo-app-automation-vpc-subnet-public1"
    }
}