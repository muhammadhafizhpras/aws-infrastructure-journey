# Environment
variable "environment" {
  description = "ENV Name (dev, stag, prod)"
  type        = string
  default     = "dev"
}

# Minimum Password Length
variable "password_minimum_length" {
  description = "Minimum Length Password"
  type        = number
  default     = 14
}

# Maximum Password Age
variable "max_password_age" {
  description = "Maximum Age of Password in days"
  type        = number
  default     = 90
}

# Lowercase Password Required
variable "lowercase_characters" {
  description = "Lowercase Characters Required"
  type        = bool
  default     = true
}

# Uppercase Password Required
variable "uppercase_characters" {
  description = "Uppercase Characters Required"
  type        = bool
  default     = true
}

# Number Required
variable "require_number" {
  description = "Number Required"
  type        = bool
  default     = true
}

# Symbols Required
variable "require_symbols" {
  description = "Symbols Required"
  type        = bool
  default     = true
}

# User can Change Password
variable "user_change_password" {
  description = "User can change password or not"
  type        = bool
  default     = true
}

# Password Reuse Prevention
variable "password_reuse_prevention" {
  description = "Number of previous passwords to prevent reuse (1-24)"
  type        = number
  default     = 5
}

# IAM Group
variable "admin_group_name" {
  description = "Group Name for Administrator Permission"
  type        = string
  default     = "Administrators"
}

# IAM User
variable "admin_user_name" {
  description = "User Name for Administrator Permission"
  type        = string
  default     = "admin-user"
}

# IAM Role
variable "ec2_role" {
  description = "IAM Role Name for EC2 on AWS"
  type        = string
  default     = "EC2-S3-Readonly-Role"
<<<<<<< Updated upstream
=======
}

#AWS Console Access
variable "console_access" {
  description = "Active Console Access"
  type        = string
  default     = true
>>>>>>> Stashed changes
}