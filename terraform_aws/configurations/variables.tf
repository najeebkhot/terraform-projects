variable region {
    description = "AWS Region to be used"
}

variable s3_bucket {
    description = ""
}

variable s3_key {
    description = ""
}

variable state_region {
    description = ""
}

variable "access_key" {
    type      = string
    default   = "XXXX"
    sensitive = true
}

variable "secret_key" {
    type      = string
    default   = "XXXX"
    sensitive = true
}

variable "region" {
    type    = string
    default = "us-east-1"
}