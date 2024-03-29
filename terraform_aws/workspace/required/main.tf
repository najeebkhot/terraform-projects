# data "aws_caller_identity" "current" {}

# data "aws_availability_zones" "available" {}

# locals {
#     aws_account_id      = data.aws_caller_identity.current.account_id
#     region              = var.region
# }

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

module "s3" {
    source = "../../configurations/required/s3"

    # S3 Configurations
    s3_bucket_name = "my-demo-app-terraform-state-bucket"
    s3_name_tag = {
        name    =  "my-demo-app-terraform-state-bucket" 
    }
}

data "aws_iam_policy_document" "sec-admin-permission" {
  statement {
    effect = "Allow"
    actions   = ["iam:*"]
    resources = ["*"]
  }
}

module "iam_user" {
    source = "../../configurations/required/iam/user"

    username = "user1"
    iam_user_tag = {
        name    =   "User1"
        app     =   "demo"
    }
    policy_name = "sec-admin"
    policy = data.aws_iam_policy_document.sec-admin-permission
}
