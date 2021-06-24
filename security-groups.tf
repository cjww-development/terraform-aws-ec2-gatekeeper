resource "aws_security_group" "https_traffic" {
  name        = "https-traffic"
  description = "Allow https traffic (port 443)"

  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_https_ip_cidr_blocks_inbound
  }

  tags = var.tags
}

resource "aws_security_group" "outbound_traffic" {
  name        = "outbound-traffic"
  description = "Allow outbound traffic"

  egress {
    description = "general outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.allowed_general_ip_cidr_blocks_outbound
  }

  tags = var.tags
}
