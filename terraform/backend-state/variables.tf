variable "aws_region" {
  description = "Region of aws to use"
  type        = string
  default     = "eu-west-2"
}

variable "aws_credentials_profile" {
  description = "High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment"
  type        = string
}

variable "aws_s3_state_bucket_name" {
  description = "Name for the backend state bucket"
  type        = string
  default     = "terraform-remotestate"
}
variable "aws_dynamodb_table_name" {
  description = "Name for the backend state locking table"
  type        = string
  default     = "terraform-statelock"
}
