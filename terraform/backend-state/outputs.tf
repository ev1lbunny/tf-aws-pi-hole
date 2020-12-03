output "remote_state_bucket_name" {
  description = "Name of the created bucket for backend remote state"
  value       = aws_s3_bucket.terraform_remotestate.bucket
}
