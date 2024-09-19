# Variables for the VPC and Others

variable "vpc_name_tag" {
  type = map
}

variable "vpc_cidr_block" {
  type      = string
  default   = "XXXX"
}

variable "assign_ipv6_cidr" {
  type      = bool
  default   = true
}

variable "vpc_instance_tenancy" {
  type      = string
  default   = "default"
}

variable "vpc_enable_dns_support" {
  type      = bool
  default   = true
}

variable "vpc_enable_dns_hostnames" {
  type      = bool
  default   = true
}

variable "vpc_id" {
  type        = string
  description = "Enter the VPC ID"
}