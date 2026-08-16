#AWS Region
variable "aws_region" {
    description = "AWS Region"
    type        = string
    default     = "ap-southeast-3"
}

# Environment
variable "environment" {
  description = "ENV Name (dev, stag, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
    description = "VPC CIDR BLOCK"
    type        = string
    default     = "10.0.0.0/16"
}

variable "enable_internet_gateway" {
    description = "Internet Gateway for Internet Access"
    type        = bool
    default     = true
}

variable "public_subnet" {
    description = "Public Subnet CIDR"
    type        = list(string)
    default     = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "private_subnet" {
    description = "Private Subnet CIDR"
    type        = list(string)
    default     = ["10.0.10.0/24","10.0.20.0/24","10.0.30.0/24"]
}

variable "availability_zones" {
    description = "List of Availability Zones"
    type        = list[string]
    default     = ["ap-southeast-3a","ap-southeast-3b","ap-southeast-3c"]
}

variable "enable_nat_gateway" {
    description = "Enable NAT Gateway"
    type        = bool
    default     = false
}



