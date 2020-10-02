
resource "aws_route53_record" "pihole" {
  count = length(var.r53_zone_id) > 0 ? 1 : 0

  zone_id = var.r53_zone_id
  name    = "pihole.${var.r53_zone}"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.pi_hole_elastic_ip.public_ip]
}

resource "aws_route53_record" "dns" {
  count = length(var.r53_zone_id) > 0 ? 1 : 0

  zone_id = var.r53_zone_id
  name    = "dns.${var.r53_zone}"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.pi_hole_elastic_ip.public_ip]
}