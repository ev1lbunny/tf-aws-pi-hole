module "pi_hole" {
  source                     = "./pi-hole"
  aws_credentials_profile    = var.aws_credentials_profile
  aws_region                 = var.aws_region
  ingress_access_ip_address  = var.ingress_access_ip_address
  pi_hole_key_pair_name      = var.pi_hole_key_pair_name
  pi_hole_web_admin_password = var.pi_hole_web_admin_password
  enable_r53_zone_code       = var.enable_r53_zone_code
  r53_zone                   = var.r53_zone
  additional_tags            = var.additional_tags
  open_vpn_source_ip         = module.open_vpn.public_ip
}

module "open_vpn" {
  source                    = "./open-vpn"
  aws_credentials_profile   = var.aws_credentials_profile
  aws_region                = var.aws_region
  ingress_access_ip_address = var.ingress_access_ip_address
  open_vpn_key_pair_name    = var.open_vpn_key_pair_name
  enable_r53_zone_code      = var.enable_r53_zone_code
  r53_zone                  = var.r53_zone
  additional_tags           = var.additional_tags
}