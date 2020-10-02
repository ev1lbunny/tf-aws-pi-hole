variable "aws_region" {
  description = "Region of aws to use"
  type        = string
}

variable "aws_credentials_profile" {
  description = "High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment"
  type        = string
}

variable "ingress_access_ip_address" {
  description = "Ip address that you will access the pihole from. All other access will be locked."
  type        = string
}

variable "pi_hole_web_admin_password" {
  description = "Password For accessing the Pihole gui admin console. Not really needed since security groups stop anyone but a single ip (your ip) from accessing it anyhow"
  type        = string
}

variable "additional_tags" {
  description = "Additional resource tags"
  type        = map(string)
}

variable "key_pair_name" {
  description = "Name to give the generated keypair that will be associated with the pihole ec2 isntance for ssh access"
  type        = string
}

variable "enable_openvpn_module" {
  description = "Boolean True/False to control the ec2 installs. Set to false if you dont want to build the openvpn instance."
  type        = bool
}

variable "enable_pihole_module" {
  description = "Boolean True/False to control the ec2 installs. Set to false if you dont want to build the pihole instance."
  type        = bool
}

variable "split_instances" {
  description = "Boolean True/False to control the ec2 installs. By default you will get 2 separate ec2 instances isolated and running independently. Set to false and it will consolidate both OpenVPN and Pihole into single EC2"
  type        = bool
}