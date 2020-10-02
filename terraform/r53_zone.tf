resource "aws_route53_zone" "myzone" {
  count = var.enable_r53_zone_code ? 1 : 0

  name = var.r53_zone
}
