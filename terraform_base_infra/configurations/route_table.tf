module "route_table" {
    source = "git@github.com:najeebkhot/terraform-modules?ref=modules/infra"

    # Route Table Configurations
    aws_vpc_id = module.vpc.vpc_id
    rtbl_name_tag = var.rtbl_tag

}