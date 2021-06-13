output "gatekeeper_instance_id" {
  value       = aws_instance.gatekeeper.id
  description = "Id of the created instance"
}

output "gatekeeper_instance_arn" {
  value       = aws_instance.gatekeeper.arn
  description = "ARN of the created instance"
}

output "gatekeeper_instance_public_ip" {
  value       = aws_eip.gatekeeper.public_ip
  description = "Public IP of the created instance"
}

output "gatekeeper_instance_public_dns" {
  value       = aws_eip.gatekeeper.public_dns
  description = "Public DNS of the created instance"
}
