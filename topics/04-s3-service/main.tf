#KMS for Encryption
resource "aws_kms" "s3_key" {
    description = "KMS Key for S3 Bucket Encryption"
}

# S3 Bucket
resource "aws_s3_bucket" "main" {
    bucket              = var.bucket_name
    object_lock_enabled = var.enable_object_lock
    force_destroy       = false

    Name = "${local.resource_name}"
}

# Public Access Blocking
resource "aws_s3_bucket_public_access_block" "main" {
    bucket                  = aws_s3_bucket.main.id
    block_public_acls       = var.block_public_acls
    block_public_policy     = var.block_public_policy
    ignore_public_acls      = var.ignore_public_acls
    restrict_public_subnet  = true
}

# Versioning
resource "aws_s3_bucket_versioning" "main" {
    bucket  = aws_s3_bucket.main.id
    versioning_configuration {
        status = var.enable_versioning ? "Enabled" : "Suspended"
    }
}

# 4.Encryption
resource "aws_s3_bucket_server_side_encryption" "main" {
    bucket  = aws_s3_bucket.main.id

    rule {
        apply_server_side_encryption_by_default {
            kms_master_key_id   = aws_kms_key.s3_key.arn
            sse_algorithm       = "aws:kms"
        }
        bucket_key_enabled = true
    }
}

# Object Lock
resource "aws_s3_bucket_object_lock_configuration" "main" {
    count       = var.enable_object_lock ? 1 : 0
    depends_on  = [aws_s3_bucket_versioning.main]
    bucket      = aws_s3_bucket.main.id

    rule {
        default_retention {
            mode = var.object_lock_mode
            Days = var.object_lock_days
        }
    }
}

# Intelligent-Tiering
resource "aws_s3_bucket_intelligent_tiering_configuration" "main" {
    count   = var.enable_intelligent_tiering ? 1 : 0
    bucket  = aws_s3.main.id
    name    = "CustomIntelligentTiering"

    tiering {
        access_tier = var.access_tier_it
        days        = var.intelligen
    }
}