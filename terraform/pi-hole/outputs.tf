output "pi_hole_public_ip" {
  description = "Pi Hole Public IP created"
  value       = aws_eip.pi_hole_elastic_ip.public_ip
}

output "pihole" {
  description = "DNS Entry"
  value       = join("", aws_route53_record.pihole.*.fqdn)
}