variable "bucket_name" {}

resource "aws_s3_bucket" "s3_proj" {
  bucket = var.bucket_name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": "*",
      "Action": "*",
      "Resource": [
        "${aws_s3_bucket.s3_proj.arn}",
        "${aws_s3_bucket.s3_proj.arn}/*"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": false
        }
      }
    }
  ]
}
EOF

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  versioning {
    enabled = true
  }
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.s3_proj.arn
}
