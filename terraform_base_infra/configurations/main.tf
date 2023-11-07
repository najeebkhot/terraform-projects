data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {}

locals {
    aws_account_id      = data.aws_caller_identity.current.account_id
    region              = var.region
}

terraform {
  required_providers {
    aws = {
        source  =   "hashicorp/aws"
        version = ">= 4.6"
    }
  }
  required_version = ">= 0.14.10"
}

data "aws_region" "current" {}

# data "terraform_region_state" "infra" {
#     backend     = "s3"

#     config = {
#         bucket = var.s3_bucket
#         key    = var.s3_key
#         region = var.state_region
#     }
# }