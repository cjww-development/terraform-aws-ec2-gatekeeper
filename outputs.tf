output "gatekeeper_instance_id" {
  value = aws_instance.gatekeeper.id
}

output "gatekeeper_instance_arn" {
  value = aws_instance.gatekeeper.arn
}

output "gatekeeper_instance_public_ip" {
  value = aws_eip.gatekeeper.public_ip
}

output "gatekeeper_instance_public_dns" {
  value = aws_eip.gatekeeper.public_dns
}
