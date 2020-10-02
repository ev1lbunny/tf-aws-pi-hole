module "pi_hole_open_vpn" {
  source                     = "./pi-hole-open-vpn"
  aws_credentials_profile    = var.aws_credentials_profile
  aws_region                 = var.aws_region
  ingress_access_ip_address  = var.ingress_access_ip_address
  pi_hole_web_admin_password = var.pi_hole_web_admin_password
  enable_pihole_module       = var.enable_pihole_module
  enable_openvpn_module      = var.enable_openvpn_module
  split_instances            = var.split_instances
  key_pair_name              = var.key_pair_name
  additional_tags            = var.additional_tags
}
