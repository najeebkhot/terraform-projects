# This file will be used as a module file for vpc creation

module "vpc" {
    source = "git@github.com:najeebkhot/terraform-modules?ref=main"

    vpc_cidr_block = var.cidr_block
    vpc_instance_tenancy = var.instance_tenancy
    vpc_enable_dns_support = var.enable_dns_support
    vpc_enable_dns_hostnames = var.enable_dns_hostnames
    vpc_name_tags = var.vpc_tags
}