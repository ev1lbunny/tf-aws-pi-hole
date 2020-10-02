variable "aws_region" {
  description = "Region of aws to use"
  type        = string
}

variable "aws_credentials_profile" {
  description = "High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment"
  type        = string
}

variable "ingress_access_ip_address" {
  description = "Ip address that you will access the openvpn from. All other access will be locked."
  type        = string
}

variable "pi_hole_web_admin_password" {
  description = "Password For accessing the Pihole gui admin console. Not really needed since security groups stop anyone but a single ip (your ip) from accessing it anyhow"
  type        = string
}

variable "key_pair_name" {
  description = "Name to give the generated keypair that will be associated with the ec2 isntance for ssh access"
  type        = string
}

variable "additional_tags" {
  description = "Additional resource tags"
  type        = map(string)
}

variable "user_data_template" {
  description = "User Data that the ec2 instance will run post creation"
}

variable "prefix_identifier" {
  description = "Prefix added to all resources in aws to differentiate between types of infra setup"
  type        = string
}
