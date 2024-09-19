# Variables for EC2

variable "ec2_ami" {
    type      = string
    default   = "XXXX"
}

variable "ec2_instance_type" {
  type = string
  default = "XXXX"
}

variable "subnet_id" {
    type = string
}

variable "ec2_network_interface" {
    type = map()
}

variable "ec2_name_tag" {
    type = map()
}

# Variables for Security Group

variable "sg_name" {
    type = string
}

variable "vpc_id" {
  type = string
}

variable "sg_description" {
  type = string
}

variable "inbound_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "Allow SSH from specific CIDR"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["203.0.113.0/24"]
    },
    {
      description = "Allow HTTP from any source"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "outbound_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTPS to specific CIDR"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["198.51.100.0/24"]
    }
  ]
}