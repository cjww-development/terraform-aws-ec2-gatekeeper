
data "aws_iam_policy_document" "gatekeeper_resources_bucket_policy" {
  statement {
    sid    = "AllowEC2InstanceProfileAccess"
    effect = "Allow"

    principals {
      type = "AWS"
      identifiers = [
        aws_iam_role.gk_role.arn
      ]
    }

    actions = [
      "s3:GetBucketLocation",
      "s3:GetObject*",
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::${var.resources_bucket_name}",
      "arn:aws:s3:::${var.resources_bucket_name}/*"
    ]
  }

  statement {
    sid    = "DenyInsecureTransport"
    effect = "Deny"

    actions = [
      "s3:*"
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      "arn:aws:s3:::${var.resources_bucket_name}",
      "arn:aws:s3:::${var.resources_bucket_name}/*"
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = [false]
    }
  }
}

resource "aws_s3_bucket" "gatekeeper_resources" {
  bucket = var.resources_bucket_name
  acl    = "private"
  policy = data.aws_iam_policy_document.gatekeeper_resources_bucket_policy.json

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  force_destroy = var.force_bucket_destroy

  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "gatekeeper_resources" {
  bucket = aws_s3_bucket.gatekeeper_resources.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
