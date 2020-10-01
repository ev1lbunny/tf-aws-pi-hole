resource "tls_private_key" "open_vpn_key_pair_config" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_open_vpn_server_keypair" {
  key_name   = var.open_vpn_key_pair_name
  public_key = tls_private_key.open_vpn_key_pair_config.public_key_openssh
}

resource "aws_instance" "open_vpn_ec2" {
  ami                    = "ami-05c424d59413a2876"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.open_vpn_security_group.id]
  key_name               = var.open_vpn_key_pair_name
  root_block_device {
    volume_size = 10
  }
  user_data = data.template_file.open_vpn_user_data.rendered
  tags = merge(
    {
      Name = "Open Vpn Server"
    },
    var.additional_tags,
  )
}

resource "aws_eip" "open_vpn_elastic_ip" {
  instance = aws_instance.open_vpn_ec2.id
  vpc      = true
  tags = merge(
    {
      Name = "Open Vpn Elastic IP"
    },
    var.additional_tags,
  )
}

data "template_file" "open_vpn_user_data" {
  template = "${file("${path.module}/templates/open-vpn-init.tpl")}"
}