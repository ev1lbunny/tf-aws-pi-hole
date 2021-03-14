output "public_ip" {
  description = "Instance Public IP created"
  value       = aws_eip.elastic_ip.public_ip
}

output "security_group_id" {
  description = "Secuirty Group Id"
  value       = aws_security_group.security_group.id
}

output "private_generated_key" {
  description = "The generated private key used to access the joint ec2 instances via ssh"
  value       = tls_private_key.key_pair_config
  sensitive   = true
}
