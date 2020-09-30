resource "aws_route53_zone" "myzone" {
  count = var.enable_r53_zone_code ? 1 : 0

  name = var.r53_zone
}

resource "aws_route53_record" "pihole" {
  count = var.enable_r53_zone_code ? 1 : 0

  zone_id = aws_route53_zone.myzone[0].id
  name    = "pihole.${var.r53_zone}"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.pi_hole_elastic_ip.public_ip]
}