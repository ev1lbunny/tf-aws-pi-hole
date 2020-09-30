resource "aws_route53_zone" "myzone" {
  name = var.r53_zone
}

resource "aws_route53_record" "pihole" {
  zone_id = aws_route53_zone.myzone.id
  name    = "pihole.${var.r53_zone}"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.pi_hole_elastic_ip.public_ip]
}