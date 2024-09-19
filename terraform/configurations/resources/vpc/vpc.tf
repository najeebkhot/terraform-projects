resource "aws_vpc" "vpc" {

    cidr_block                          = var.vpc_cidr_block
    assign_generated_ipv6_cidr_block    = var.assign_ipv6_cidr
    instance_tenancy                    = var.vpc_instance_tenancy
    enable_dns_support                  = var.vpc_enable_dns_support
    enable_dns_hostnames                = var.vpc_enable_dns_hostnames
    tags                                = var.vpc_name_tag
    
}

