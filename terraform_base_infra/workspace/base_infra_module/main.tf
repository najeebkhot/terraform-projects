# data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {}

locals {
    aws_account_id      = data.aws_caller_identity.current.account_id
    region              = var.region
}

provider "aws" {

  region = "us-east-1"
  skip_metadata_api_check = true
  skip_region_validation = true
  skip_credentials_validation = true
  skip_requesting_account_id = true
#    access_key = var.access_key
#    secret_key = var.secret_key

  default_tags {
    tags = {
        team            = "my-demo-app"
        env             = "prod"
        application     = "my-demo-app"
    }
}
}

# terraform {
#   backend "s3" {
#     bucket          = "value"
#     key             = "value"
#     dynamodb_table  = "value"
#     encrypt         = true
#     region          = "value"    
#   }
# }

module "vpc" {
    source = "../../configurations/base_infra_aws/vpc"

    # VPC Configurations

    vpc_cidr_block              = "10.0.0.0/16"
    vpc_instance_tenancy        = "default"
    vpc_enable_dns_support      = true
    vpc_enable_dns_hostnames    = true
    vpc_name_tag = {
        Name = "my-demo-app-automation-vpc-vpc"
    }
}
module "public_subnet_1" {
    source = "../../configurations/base_infra_aws/subnet"

    aws_vpc_id = module.vpc.vpc_id
    subnet_az = "us-east-1a"
    #subnet_az_id = "aps1-az1"
    subnet_cidr_block = "10.0.0.0/20"
    subnet_name_tag = {
        Name    =   "my-demo-app-automation-vpc-subnet-public1"
    }
}

module "public_subnet_2" {
    source = "../../configurations/base_infra_aws/subnet"

    aws_vpc_id = module.vpc.vpc_id
    subnet_az = "us-east-1b"
    #subnet_az_id = "aps1-az3"
    subnet_cidr_block = "10.0.16.0/20"
    subnet_name_tag = {
        Name    =   "my-demo-app-automation-vpc-subnet-public2"
    }
}

module "private_subnet_1" {
    source = "../../configurations/base_infra_aws/subnet"

    aws_vpc_id = module.vpc.vpc_id
    subnet_az = "us-east-1a"
    #subnet_az_id = "aps1-az1"
    subnet_cidr_block = "10.0.128.0/20"
    subnet_name_tag = {
        Name    =   "my-demo-app-automation-vpc-subnet-private1"
    }
}

module "private_subnet_2" {
    source = "../../configurations/base_infra_aws/subnet"

    aws_vpc_id = module.vpc.vpc_id
    subnet_az = "us-east-1b"
    #subnet_az_id = "aps1-az3"
    subnet_cidr_block = "10.0.144.0/20"
    subnet_name_tag = {
        Name    =   "my-demo-app-automation-vpc-subnet-public2"
    }
}

module "route_table" {
    source = "../../configurations/base_infra_aws/route_table"

    # Route Table Configurations
    aws_vpc_id = module.vpc.vpc_id
    rtbl_name_tag = {
        Name    =   "my-demo-app-automation-vpc-rtb-public"
    }

}

module "rtbl-pub_sub1_association" {
  source = "../../configurations/base_infra_aws/rtbl_association"

    # Route Table Association Configuration
    subnet_id  = module.public_subnet_1.subnet_id
    rtbl_id    = module.route_table.rtbl_id
}

module "rtbl-pub_sub2_association" {
  source = "../../configurations/base_infra_aws/rtbl_association"

    # Route Table Association Configuration
    subnet_id  = module.public_subnet_2.subnet_id
    rtbl_id    = module.route_table.rtbl_id
}

module "internet_gateway" {
    source = "../../configurations/base_infra_aws/internet_gateway"


    # Internet Gateway Configurations
    aws_vpc_id = module.vpc.vpc_id
    igw_name_tag = {
        Name    =   "my-demo-app-automation-vpc-igw"
    }
}

# module "internet_gateway_attachment" {
#     source = "../../configurations/base_infra_aws/igw_association"

#     aws_vpc_id = module.vpc.vpc_id
#     aws_igw_id = module.internet_gateway.internet_gateway_id
# }

module "endpoint" {
    source = "../../configurations/base_infra_aws/endpoint"

    aws_vpc_id = module.vpc.vpc_id
    endpoint_service_name = "com.amazonaws.us-east-1.s3"
    endpoint_name_tag = {
        Name    =   "my-demo-app-automation-vpc-igw"
    }
}

module "endpoint_rtbl_association" {
    source = "../../configurations/base_infra_aws/endpoint_association"

    rtbl_id = module.route_table.rtbl_id
    vpc_endpoint_id = module.endpoint.endpoint_id
}

module "elastic_ip" {
  source = "../../configurations/base_infra_aws/elastic_ip"
#   elastic_ip_vpc = true
  elastic_ip_domain = "vpc"
}

module "nat_gateway" {
  source = "../../configurations/base_infra_aws/nat_gateway"

  aws_elastic_ip_id = module.elastic_ip.elastic_ip_id
  subnet_id = module.public_subnet_1.subnet_id
  nat_gw_name_tag = {
    Name    =   "my-demo-app-nat-gateway"
  }
}
