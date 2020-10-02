module "pi_hole" {
  count = var.enable_pihole_module ? 1 : 0

  source                     = "./pi-hole"
  aws_credentials_profile    = var.aws_credentials_profile
  aws_region                 = var.aws_region
  ingress_access_ip_address  = var.ingress_access_ip_address
  pi_hole_key_pair_name      = var.pi_hole_key_pair_name
  pi_hole_web_admin_password = var.pi_hole_web_admin_password
  r53_zone                   = var.r53_zone
  r53_zone_id                = aws_route53_zone.myzone[0].id
  additional_tags            = var.additional_tags
  open_vpn_source_ip         = module.open_vpn[0].public_ip
}

module "open_vpn" {
  count = var.enable_openvpn_module ? 1 : 0

  source                    = "./open-vpn"
  aws_credentials_profile   = var.aws_credentials_profile
  aws_region                = var.aws_region
  ingress_access_ip_address = var.ingress_access_ip_address
  open_vpn_key_pair_name    = var.open_vpn_key_pair_name
  r53_zone                  = var.r53_zone
  r53_zone_id               = aws_route53_zone.myzone[0].id
  additional_tags           = var.additional_tags
}