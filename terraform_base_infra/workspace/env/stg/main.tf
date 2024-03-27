provider "aws" {
    region      = "us-east-1"
    access_key = var.access_key
    secret_key = var.secret_key
    # skip_metadata_api_check = true
    # skip_region_validation = true
    # skip_credentials_validation = true
    # skip_requesting_account_id = true
}

# terraform {
#   backend "s3" {
#     bucket          = ""
#     key             = ""
#     dynamodb_table  = ""
#     encrypt         = true
#     region          = ""
#   }
# }

module "infra" {
    source = "../../../../terraform_base_infra/configurations"

    region = "us-east-1"

    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true
    vpc_tags = {
        Name = "Main VPC"
    }
    
}