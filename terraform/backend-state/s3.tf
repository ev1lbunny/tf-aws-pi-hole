resource "random_id" "state_bucket_rand" {
  byte_length = 2
}

resource "aws_kms_key" "tf_bucket_encrypt_at_rest" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags = {
    Name = "Terraform Key for s3 bucket at rest encryption"
  }
}

resource "aws_s3_bucket" "terraform_remotestate" {
  bucket = "${var.aws_s3_state_bucket_name}-${random_id.state_bucket_rand.dec}"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.tf_bucket_encrypt_at_rest.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  logging {
    target_bucket = aws_s3_bucket.tf_state_log_bucket.id
    target_prefix = "log/"
  }

  tags = {
    Name = "Terraform s3 State Bucket"
  }
}

resource "aws_s3_bucket" "tf_state_log_bucket" {
  bucket = "tf-state-log-bucket"
  acl    = "log-delivery-write"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.tf_bucket_encrypt_at_rest.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_object" "remotestate_folder" {
  bucket = aws_s3_bucket.terraform_remotestate.id
  key    = "terraform-aws/pihole_openvpn/"
}
