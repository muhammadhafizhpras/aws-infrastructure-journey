variable aws_region {
  type        = string
  default     = "ap-southeast-3"
  description = "region"
}

variable "environment" {
    type        = string
    default     = "prod"
    description =  "ENV tag (dev, stag, prod)"

    validation {
        condition   = contains (["dev", "stag", "prod"])
    }  
}

variable "project_name" {
  type        = string
  default     = "aws-project"
  description = "Project Name"
}

variable "bucket_name" {
  type        = string
  description = "Prefix Name for s3 must unique scale global"
}

variable "enable_versioning" {
  type        = bool
  default     = true
  description = "for enabled versioning"
}

variable "enable_intelligent_tiering" {
  type        = bool
  default     = true 
  description = "True for Enable dan False for DIsable"
}

variable "intelligent_tiering_days" {
  type        = number
  default     = 
  description = "description"
}


variable "access_tier_it" {
  type        = string
  default     = "ARCHIVE_ACCESS"
  description = "Access tier"
}

variable "enable_standart_ia" {
  type        = bool
  default     = true
  description = "True for Enable dan False for DIsable"
}

variable "standart_ia_days" {
  type        = number
  default     = 30
  description = "Days for transisi"
}

variable "enable_onezone_ia" {
  type        = bool
  default     = true
  description = "True for Enable dan False for DIsable"
}

variable "onezone_ia_days" {
  type        = number
  default     = 60
  description = "Days for transition from onezone ia to glacier"
}

variable "enable_glacier_flexible" {
  type        = bool
  default     = true
  description = "True for Enable dan False for DIsable"
}

variable "glacier_flexible_days" {
  type        = number
  default     = 90
  description = "Days for transition from onzone ia to glacier flexible"
}

variable "enable_glacier_deep_archive" {
  type        = bool
  default     = true
  description = "True for Enable and False for Disable"
}

variable "glacier_deep_archive_days" {
  type        = number
  default     = 180
  description = "Days for trasition from glacier flexible to glacier deep archive"
}

variable "enable_object_lock {
  type        = bool
  default     = true
  description = "Enable Object Lock"
}

variable "object_lock_mode" {
  type        = string
  default     = "COMPLIANCE"
  description = "Mode (COMPLIANCE or GOVERNANCE)"

  validation {
    condition = contains(["COMPLIANCE", "GOVERNANCE"], var.object_lock_mode)
    error_message   = "COMPLIANCE or GOVERNANCE"
  }
}

variable "object_lock_days" {
  type        = number
  default     = 30
  description = "Duration retention object for lock"
}

variable "bucket_tags" {
  type        = map(string)
  default     = ""
  description = "Tagging"
}

# BLOCK PUBLIC ACCESS PARAMETER
variable "block_public_acls" {
  type        = bool
  default     = true
  description = "Blocking create Public ACL"
}

variable "block_public_policy" {
  type        = bool
  default     = true
  description = "Block Create Public Policy"
}

variable "ignore_public_acls" {
  type        = bool
  default     = true
  description = "Ignore Existing all Public ACL"
}

variable "restrict_public_subnet" {
  type        = bool
  default     = true
  description = "Block Public Subnet access s3"
}












