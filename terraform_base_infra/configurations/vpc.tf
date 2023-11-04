#This file will be used as a module file for vpc creation

module "vpc" {
    source = "git@github.com:najeebkhot/terraform-modules.git"
    
    cidr_block = var.cidr_block
}