resource "aws_instance" "pi_hole_ec2" {
  ami           = "ami-09a1e275e350acf38"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.pi_hole_security_group.id]
  depends_on = [module.iam_user]
}