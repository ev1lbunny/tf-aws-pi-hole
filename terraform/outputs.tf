output "public_ip" {
  description = "Instance Public IP created"
  value       = module.pi_hole_open_vpn.public_ip
}

output "security_group_id" {
  description = "Secuirty Group Id"
  value       = module.pi_hole_open_vpn.security_group_id
}

output "private_generated_key" {
  description = "The generated private key used to access the joint ec2 instances via ssh"
  value       = module.pi_hole_open_vpn.private_generated_key
  sensitive = true
}