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

resource "aws_security_group" "http_traffic" {
  name        = "http-traffic"
  description = "Allow http traffic (port 80)"

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_https_ip_cidr_blocks_inbound
  }

  tags = var.tags
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh-traffic"
  description = "Allow ssh traffic (port 22)"

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_ip_cidr_blocks_inbound
  }

  tags = var.tags
}

resource "aws_security_group" "docker_socket_traffic" {
  name        = "docker-socket-traffic"
  description = "Allow docker socket connectivity"

  ingress {
    description = "docker"
    from_port   = 2376
    to_port     = 2376
    protocol    = "tcp"
    cidr_blocks = var.allowed_docker_socket_ip_cidr_blocks_inbound
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
