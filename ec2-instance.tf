data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "gatekeeper" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.ec2_instance_type

  vpc_security_group_ids = [
    aws_security_group.https_traffic.id,
    aws_security_group.outbound_traffic.id,
  ]

  subnet_id = aws_default_subnet.default_subnet_a.id

  iam_instance_profile = aws_iam_instance_profile.gk_instance_role.name

  user_data = file(var.user_data_file_path)

  monitoring = true

  tags = var.tags
}

resource "aws_eip" "gatekeeper" {
  vpc      = true
  instance = aws_instance.gatekeeper.id
}
