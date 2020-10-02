resource "tls_private_key" "key_pair_config" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_server_keypair" {
  key_name   = "${var.prefix_identifier} ${var.key_pair_name}"
  public_key = tls_private_key.key_pair_config.public_key_openssh
}

resource "aws_instance" "ec2" {
  ami                    = "ami-05c424d59413a2876"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  key_name               = "${var.prefix_identifier} ${var.key_pair_name}"
  root_block_device {
    volume_size = 15
  }
  user_data = data.template_file.user_data.rendered
  tags = merge(
    {},
    var.additional_tags,
  )
}

resource "aws_eip" "elastic_ip" {
  instance = aws_instance.ec2.id
  vpc      = true
  tags = merge(
    {},
    var.additional_tags,
  )
}

data "template_file" "user_data" {
  template = var.user_data_template
  vars = {
    web_admin_password = var.pi_hole_web_admin_password
  }
}
