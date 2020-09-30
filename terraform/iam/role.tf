data "aws_iam_policy_document" "pi_hole_management_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "pi_hole_management_role" {
  name               = var.pi_hole_management_role
  assume_role_policy = data.aws_iam_policy_document.pi_hole_management_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "pi_hole_role_policy_attachment" {
  role       = aws_iam_role.pi_hole_management_role.name
  policy_arn = aws_iam_policy.pi_hole_management_policy.arn
}