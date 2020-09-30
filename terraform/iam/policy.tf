resource "aws_iam_policy" "pi_hole_management_policy" {
  name        = "pi-hole-management-policy"
  description = "assuming this role lets the user create the pi-hole instances"
  policy      = file("${path.module}/policies/pi-hole-management.policy")
}

resource "aws_iam_user_policy_attachment" "pi_hole_user_attachment" {
  user       = aws_iam_user.pi_hole_iam_user.name
  policy_arn = aws_iam_policy.pi_hole_management_policy.arn
}