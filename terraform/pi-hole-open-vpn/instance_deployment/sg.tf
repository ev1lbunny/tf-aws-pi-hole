resource "aws_security_group" "security_group" {
  name        = "${var.prefix_identifier}security-group"
  description = "Configures All rules required for ${var.prefix_identifier} instance access and management"

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
    description = "Home LAN OPENVPN UDP Access"
    from_port   = 1194
    to_port     = 1194
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "OpenVPN / Pi Hole Security Group"
    },
    var.additional_tags,
  )
}
