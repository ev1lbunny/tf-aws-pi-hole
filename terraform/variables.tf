variable "aws_region" {
  description = "Region of aws to use"
  default     = "eu-west-2"
}

variable "pi_hole_management_role" {
  description = "Rolename created from the iam code used for managing the pi-hole instance"
  default     = "pi-hole-management-role"
}

variable "aws_credentials_profile" {
  description = "High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment"
}

variable "ingress_access_ip_address" {
  description = "Ip address that you will access the pihole from. All other access will be locked."
}

variable "key_pair_name" {
  description = "Name to give the generated keypair that will be associated with the ec2 isntance for ssh access"
  default     = "pi-hole-server-keypair"
}

variable "pi_hole_web_admin_password" {
  description = "Password For accessing the Pihole gui admin console. Not really needed since security groups stop anyone but a single ip (your ip) from accessing it anyhow"
  default     = ""
}