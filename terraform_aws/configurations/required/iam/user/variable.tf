variable "username" {
  type = string
}

variable "iam_user_tag" {
  type = map
}

variable "policy_name" {
  type = string
}

variable "policy" {
  type = map()
}