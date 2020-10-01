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

variable "pi_hole_key_pair_name" {
  description = "Name to give the generated keypair that will be associated with the pihole ec2 isntance for ssh access"
  type        = string
}

variable "pi_hole_web_admin_password" {
  description = "Password For accessing the Pihole gui admin console. Not really needed since security groups stop anyone but a single ip (your ip) from accessing it anyhow"
  type        = string
}

variable "enable_r53_zone_code" {
  description = "Boolean true/false flag that tells the terraform to run the route53 code if you have a zone setup already. If enabled remember to set r53_zone variable too."
  type        = bool
}

variable "r53_zone" {
  description = "Route 53 Zone"
  type        = string
}

variable "additional_tags" {
  description = "Additional resource tags"
  type        = map(string)
}

variable "open_vpn_source_ip" {
  description = "OpenVPN instance ip so that it can access pihole as DNS server."
  type        = string
}