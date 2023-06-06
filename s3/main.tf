
resource "aws_s3_bucket" "log_bucket" {
  count  = var.logging_enable ? 1 : 0
  bucket = local.log_bucket_name

  lifecycle_rule {
    id      = "log-cleanup"
    enabled = true
    prefix  = var.logging_config.prefix

    transition {
      days          = var.logging_config.lifecycle_thresholds[0]
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.logging_config.lifecycle_thresholds[1]
      storage_class = "GLACIER"
    }

    expiration {
      days = var.logging_config.lifecycle_thresholds[2]
    }
  }

  tags = {
    Name = local.log_bucket_name
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = local.bucket_name

  dynamic "logging" {
    for_each = var.logging_enable ? [1] : []
    content {
      target_bucket = aws_s3_bucket.log_bucket[0].bucket
      target_prefix = var.logging_config.prefix
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.expiration_rules
    iterator = rule
    content {
      id      = "expiration-rule-${rule.key}"
      enabled = true
      prefix  = rule.value["prefix"]
      expiration {
        days = rule.value["days"]
      }
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.transition_rules
    iterator = rule
    content {
      id      = "transition-rule-${rule.key}"
      enabled = true
      prefix  = rule.value["prefix"]
      transition {
        days          = rule.value["days"]
        storage_class = rule.value["storage_class"]
      }
    }
  }

  tags = {
    Name   = local.bucket_name
    Backup = var.dr_backup
  }
}

resource "aws_s3_bucket_public_access_block" "log_bucket_public_access_block" {
  count                   = var.logging_enable ? 1 : 0
  bucket                  = aws_s3_bucket.log_bucket[0].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}


resource "aws_s3_bucket_acl" "bucket_log_acl" {
  count  = var.logging_enable ? 1 : 0
  bucket = aws_s3_bucket.log_bucket[count.index]
  acl    = "private"
}


resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encrypt" {
  bucket = aws_s3_bucket.bucket.bucket
  rule {
    bucket_key_enabled = local.sse_config.bucket_key_enabled
    apply_server_side_encryption_by_default {
      sse_algorithm = local.sse_config.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "log_bucket_encrypt" {
  count  = var.logging_enable ? 1 : 0
  bucket = aws_s3_bucket.log_bucket[count.index]
  rule {
    bucket_key_enabled = local.sse_config.bucket_key_enabled
    apply_server_side_encryption_by_default {
      sse_algorithm = local.sse_config.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = var.versioning
  }
}