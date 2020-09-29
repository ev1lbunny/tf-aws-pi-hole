resource "tls_private_key" "pi_hole_key_pair_config" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_pi_hole_server_keypair" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.pi_hole_key_pair_config.public_key_openssh
}

resource "aws_instance" "pi_hole_ec2" {
  ami                    = "ami-09a1e275e350acf38"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.pi_hole_security_group.id]
  key_name               = var.key_pair_name
  depends_on             = [module.iam_user]
}