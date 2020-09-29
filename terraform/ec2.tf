resource "aws_instance" "pi_hole_ec2" {
  ami           = "ami-0c09927662c939f41"
  instance_type = "t2.micro"

  depends_on = [module.iam_user]
}