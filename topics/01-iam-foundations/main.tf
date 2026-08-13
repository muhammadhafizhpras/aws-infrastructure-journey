#IAM Account Password Policy
resource "aws_iam_account_password_policy" "strict_policy" {
    minimum_password_length         = var.password_minimum_length
    require_lowercase_characters    = var.require_lowercase_characters
    require_uppercase_characters    = var.require_uppercase_characters
    require_number                  = var.require_number
    require_symbols                 = var.require_symbols
    allow_user_to_change_password   = var.user_change_password
    password_reuse_prevention       = var.password_reuse_prevention
    max_password_age                = var.max_password_age
}

#IAM User Group
resource "aws_iam_group" "admin" {
    name = var.admin_group_name
}

res