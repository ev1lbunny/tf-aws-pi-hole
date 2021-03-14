output "public_ip" {
  description = "Instance Public IP created"
  value       = module.shared_instance[*].public_ip
}

output "security_group_id" {
  description = "Secuirty Group Id"
  value       = module.shared_instance[*].security_group_id
}

output "private_generated_key" {
  description = "The generated private key used to access the joint ec2 instances via ssh"
  value       = module.shared_instance[*].private_generated_key
  sensitive   = true
}
