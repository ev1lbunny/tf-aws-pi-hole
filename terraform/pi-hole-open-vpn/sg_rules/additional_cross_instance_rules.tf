resource "aws_security_group_rule" "tcp_dns_in" {
  description       = "VPN to Pihole DNS TCP Access"
  type              = "ingress"
  from_port         = 53
  to_port           = 53
  protocol          = "tcp"
  cidr_blocks       = ["${var.instance_access_ip_address}/32"]
  security_group_id = module.pi_hole_instance.security_group_id
}
resource "aws_security_group_rule" "udp_dns_in" {
  description       = "VPN to Pihole DNS UDP Access"
  type              = "ingress"
  from_port         = 53
  to_port           = 53
  protocol          = "udp"
  cidr_blocks       = ["${var.instance_access_ip_address}/32"]
  security_group_id = module.pi_hole_instance.security_group_id
}
resource "aws_security_group_rule" "tcp_http_in" {
  description       = "VPN to Pihole HTTP Access"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["${var.instance_access_ip_address}/32"]
  security_group_id = module.pi_hole_instance.security_group_id
}
resource "aws_security_group_rule" "tcp_https_in" {
  description       = "VPN to Pihole HTTPS Access"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["${var.instance_access_ip_address}/32"]
  security_group_id = module.pi_hole_instance.security_group_id
}
