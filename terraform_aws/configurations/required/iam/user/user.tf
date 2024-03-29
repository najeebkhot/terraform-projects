resource "aws_iam_user" "iam_user" {
    name = var.username
    tags = var.iam_user_tag
}

resource "aws_iam_policy" "userpolicy" {
    name = var.policy_name
    policy = var.policy
}

resource "aws_iam_user_login_profile" "login_password" {
  user    = aws_iam_user.iam_user.name
}