resource "aws_s3_bucket" "project_alpha" {
  bucket = "s3_proj_alpha"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  acl    = "private"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": "*",
      "Action": "*",
      "Resource": [
        "${aws_s3_bucket.project_alpha.arn}",
        "${aws_s3_bucket.project_alpha.arn}/*"
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

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "project_beta" {
  bucket = "s3_proj_beta"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  acl    = "private"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": "*",
      "Action": "*",
      "Resource": [
        "${aws_s3_bucket.project_alpha.arn}",
        "${aws_s3_bucket.project_alpha.arn}/*"
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

  versioning {
    enabled = true
  }
}
