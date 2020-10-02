variable "aws_region" {
  description = "Region of aws to use"
  type        = string
  default     = "eu-west-2"
}

variable "aws_credentials_profile" {
  description = "High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment"
  type        = string
}

variable "ingress_access_ip_address" {
  description = "Ip address that you will access the pihole from. All other access will be locked."
  type        = string
}

variable "open_vpn_key_pair_name" {
  description = "Name to give the generated keypair that will be associated with the open vpn ec2 isntance for ssh access"
  type        = string
  default     = "open-vpn-server-keypair"
}

variable "pi_hole_key_pair_name" {
  description = "Name to give the generated keypair that will be associated with the pihole ec2 isntance for ssh access"
  type        = string
  default     = "pi-hole-server-keypair"
}

variable "pi_hole_web_admin_password" {
  description = "Password For accessing the Pihole gui admin console. Not really needed since security groups stop anyone but a single ip (your ip) from accessing it anyhow"
  type        = string
  default     = ""
}

variable "enable_r53_zone_code" {
  description = "Boolean true/false flag that tells the terraform to run the route53 code if you have a zone setup already. If enabled remember to set r53_zone variable too."
  type        = bool
  default     = false
}

variable "r53_zone" {
  description = "Route 53 Zone"
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "Additional resource tags"
  type        = map(string)
  default     = {}
}

variable "enable_openvpn_module" {
  description = "Boolean True/False to control the ec2 installs. Set to false if you dont want to build the openvpn instance."
  type        = bool
  default     = true
}

variable "enable_pihole_module" {
  description = "Boolean True/False to control the ec2 installs. Set to false if you dont want to build the pihole instance."
  type        = bool
  default     = true
}
