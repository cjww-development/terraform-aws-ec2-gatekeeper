resource "aws_iam_instance_profile" "gk_instance_role" {
  name = "GatekeeperInstanceRole"
  role = aws_iam_role.gk_role.name
}

data "aws_iam_policy_document" "gk_role" {
  statement {
    sid    = "AssumeRole"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role" "gk_role" {
  name               = "GatekeeperInstanceRole"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.gk_role.json
}
