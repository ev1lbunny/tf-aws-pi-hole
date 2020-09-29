variable "aws_region" {
  description = "Region of aws to use"
  default     = "eu-west-2"
}

variable "pi_hole_management_role" {
  description = "Rolename created from the iam code used for managing the pi-hole instance"
  default     = "pi-hole-management-role"
}

variable "aws_credentials_profile" {
  description = "High level rofile name that the terraform uses for aws access to create new role/policy/user for pihole deployment"
}

variable "ingress_access_ip_address" {
  description = "Ip address that you will access the pihole from. All other access will be locked."
}