output "public_ip" {
  description = "Instance Public IP created for ${var.prefix_identifier}"
  value       = aws_eip.elastic_ip.public_ip
}