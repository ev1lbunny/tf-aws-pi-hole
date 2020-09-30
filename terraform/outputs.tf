output "public_ip" {
  value = aws_eip.pi_hole_elastic_ip.public_ip
}