resource "aws_security_group" "pi_hole_security_group" {
  name        = "pi-hole-security-group"
  description = "Configures All rules required for Pihole access and management"

  ingress {
    description = "Home LAN SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_access_ip_address}/32"]
  }

  ingress {
    description = "Home LAN HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_access_ip_address}/32"]
  }

  ingress {
    description = "Home LAN HTTPS Access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_access_ip_address}/32"]
  }

  ingress {
    description = "Home LAN DNS UDP Access"
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["${var.ingress_access_ip_address}/32"]
  }

  ingress {
    description = "Home LAN DNS TCP Access"
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_access_ip_address}/32"]
  }

  ingress {
    description = "Lets Encrypts HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.65.32.248/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "Pi Hole Security Group"
    },
    var.additional_tags,
  )
}

resource "aws_security_group" "open_vpn_to_pi_hole_security_group" {

  name        = "open-vpn-pi-hole-security-group"
  description = "Configures All rules required for open vpn instance to use pihole as dns lookup"

  ingress {
    description = "OpenVPN DNS UDP Access"
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["${var.open_vpn_source_ip}/32"]
  }

  ingress {
    description = "OpenVPN LAN DNS TCP Access"
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["${var.open_vpn_source_ip}/32"]
  }

  ingress {
    description = "Pihole Admin Access From VPN IP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.open_vpn_source_ip}/32"]
  }

  ingress {
    description = "Pihole Admin Access From VPN IP"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.open_vpn_source_ip}/32"]
  }



  tags = merge(
    {
      Name = "Open VPN DNS Access to Pi Hole Security Group"
    },
    var.additional_tags,
  )
}