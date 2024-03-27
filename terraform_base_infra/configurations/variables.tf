variable region {
    description = "AWS Region to be used"
}

# variable s3_bucket {
#     description = ""
# }

# variable s3_key {
#     description = ""
# }

# variable state_region {
#     description = ""
# }

variable cidr_block {
    type = string
    default = "0.0.0.0/0"
    description = "CIDR Block for VPC"
}

variable instance_tenancy {
    type = string
    default = "default"
}

variable enable_dns_support {
    type = bool
    default = true
}

variable enable_dns_hostnames {
    type = bool
    default = true
}

variable vpc_tags {
    type = map(string)
    nullable = true
}

variable rtbl_tag {
    type = map(string)
    nullable = true
}