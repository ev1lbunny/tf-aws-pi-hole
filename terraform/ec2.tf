resource "aws_instance" "pi_hole_ec2" {
  ami           = "ami-09a1e275e350acf38"
  instance_type = "t2.micro"

  depends_on = [module.iam_user]
}