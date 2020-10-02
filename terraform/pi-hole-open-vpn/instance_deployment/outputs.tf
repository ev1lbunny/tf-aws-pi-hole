output "public_ip" {
  description = "Instance Public IP created"
  value       = aws_eip.elastic_ip.public_ip
}
