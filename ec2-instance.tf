
data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]
}

data "aws_iam_instance_profile" "gk_instance_role" {
  name = "GatekeeperInstanceRole"
}

resource "aws_instance" "gatekeeper" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.ec2_instance_type

  key_name = var.ssh_key_name

  vpc_security_group_ids = [
    aws_security_group.https_traffic.id,
    aws_security_group.ssh_traffic.id,
    aws_security_group.outbound_traffic.id
  ]

  subnet_id = aws_default_subnet.default_subnet_a.id

  iam_instance_profile = data.aws_iam_instance_profile.gk_instance_role.name

  //  user_data = ""
  //  user_data_base64 = ""

  root_block_device {
    encrypted   = true
    volume_size = 0
    volume_type = "standard"
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = var.tags
}

resource "aws_eip" "gatekeeper" {
  vpc      = true
  instance = aws_instance.gatekeeper.id
}
