output "public_ip" {
  description = "Instance Public IP created"
  value       = aws_eip.elastic_ip.public_ip
}

output "security_group_id" {
  description = "Secuirty Group Id"
  value       = aws_security_group.security_group.id
}
