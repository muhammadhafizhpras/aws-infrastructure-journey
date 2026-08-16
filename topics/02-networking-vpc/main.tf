
#VPC
resource "aws_vpc" "main" {
    cidr_block            = var.vpc_cidr
    enable_dns_support    = true
    enable_dns_hostnnames = true

    tags = merge(local.common_tags, {
        Name = "${local.name_resource}"
    })
}

resource "aws_internet_gateway" "igw" {
    vpc_id  = aws_vpc.main.id

    tags = merge(local.common_tags, {
        Name = "${local.name_resource}"
    })
}


resource "aws_subnet" "public" {
    for_each    = var.public_subnet
    
    vpc_id                  = aws_vpc.main.id
    cidr_block              = each.value.cidr_block
    availability_zone       = each.value.az
    map_on_public_launch_ip = true 

     tags = merge(local.common_tags, {
        Name = "${local.name_resource}"
        Tier = "public"
    }) 
}

resource "aws_subnet" "private" {
    for_each    = var.private_subnet

    vpc_id            = aws_vpc.main.id
    cidr_block        = each.value.cidr_block
    availability_zone = each.value.az

     tags = merge(local.common_tags, {
        Name = "${local.name_resource}"
        Tier = "private"
    }) 
}

resource "aws_eip" "nat" {
    for_each    = var.enable_nat_gateway ? local.nat_gateway_map : {}
    domain      = "vpc"

    tags = merge(local.common_tags, {
        Name = "${local.name_resource}-eip"
    })
}