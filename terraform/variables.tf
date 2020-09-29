variable "aws_region" {
  description = "Region of aws to use"
  default     = "eu-west-2"
}

variable "pi_hole_management_role" {
  description = "Rolename created from the iam code used for managing the pi-hole instance"
  default     = "pi-hole-management-role"
}

variable "pi_hole_management_session_name" {
  description = "Session name passed to the assume role when running setup"
  default     = "Pi-hole Management Role Session"
}

variable "aws_credentials_profile" {
  description = "High level rofile name that the terraform uses for aws access to create new role/policy/user for pihole deployment"
}