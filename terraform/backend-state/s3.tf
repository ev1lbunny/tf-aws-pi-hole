resource "random_id" "state_bucket_rand" {
  byte_length = 2
}

resource "aws_s3_bucket" "terraform_remotestate" {
  bucket = "${var.aws_s3_state_bucket_name}-${random_id.state_bucket_rand.dec}"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = "Terraform s3 State Bucket"
  }
}

resource "aws_s3_bucket_object" "remotestate_folder" {
  bucket = aws_s3_bucket.terraform_remotestate.id
  key    = "terraform-aws/pihole_openvpn/"
}