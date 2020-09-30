resource "tls_private_key" "pi_hole_key_pair_config" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_pi_hole_server_keypair" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.pi_hole_key_pair_config.public_key_openssh
}

resource "aws_instance" "pi_hole_ec2" {
  ami                    = "ami-05c424d59413a2876"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.pi_hole_security_group.id]
  key_name               = var.key_pair_name
  root_block_device {
    volume_size = 20
  }
  user_data = data.template_file.pi_hole_user_data.rendered
  tags = {
    "Name" = "AWS Pi Hole Server"
  }
}

resource "aws_eip" "pi_hole_elastic_ip" {
  instance = aws_instance.pi_hole_ec2.id
  vpc      = true
}

data "template_file" "pi_hole_user_data" {
  template = "${file("${path.module}/templates/pi-hole-init.tpl")}"
  vars = {
    web_admin_password = var.pi_hole_web_admin_password
  }
}