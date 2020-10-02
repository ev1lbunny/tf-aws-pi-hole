variable "instance_access_ip_address" {
  description = "Ip address that the vpn instances will access the pihole from."
  type        = string
}

variable "pi_hole_instance_sg_id" {
  description = "SG id associated with pi-hole that the new rules will bind too."
  type        = string
}
