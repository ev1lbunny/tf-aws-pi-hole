resource "aws_route53_record" "openvpn" {
  count = length(var.r53_zone_id) > 0 ? 1 : 0

  zone_id = var.r53_zone_id
  name    = "openvpn.${var.r53_zone}"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.open_vpn_elastic_ip.public_ip]
}