output "open_vpn_public_ip" {
  description = "OpenVPN Public IP created"
  value       = module.open_vpn.public_ip
}

output "pi_hole_public_ip" {
  description = "Pi Hole Public IP created"
  value       = module.pi_hole.public_ip
}

output "open_vpn_r53_entries" {
  description = "OpenVPN DNS Entries"
  value       = module.open_vpn.r53_entry
}

output "pi_hole_r53_entries" {
  description = "Pi Hole DNS Entries"
  value       = module.open_vpn.r53_entry
}