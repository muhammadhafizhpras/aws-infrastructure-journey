locals {
    name_resource   = "${var.project_name}-${var.environment}"
    nat_subnet_keys = var.single_nat_gateway ? [keys(var.public_subnet)[0]] : keys(var.public_subnet)
    nat_gateway_map = { for subnet in local.nat_subnet_keys : subnet => subnet}
    common_tags = merge(
        {
            Project     = var.project_name
            Environment = var.environment
            ManagedBy   = "terraform"
        },
        var.tags
    )
}

