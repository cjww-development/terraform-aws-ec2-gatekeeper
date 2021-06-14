variable "ec2_instance_type" {
  type        = string
  description = "What instance type ec2 should adopt. t4g.micro is currently the smallest and cheapest gatekeeper can run on."
}

# variable "ssh_key_name" {
#   type        = string
#   description = "Name of the ssh key pair used to ssh into the instance."
# }

variable "allowed_https_ip_cidr_blocks_inbound" {
  type        = list(string)
  description = "Networks that are allowed to access the ec2 instance via https (port 443)"
}

variable "allowed_ssh_ip_cidr_blocks_inbound" {
  type        = list(string)
  description = "Networks that are allowed to access the ec2 instance via ssh (port 22)"
}

variable "allowed_general_ip_cidr_blocks_outbound" {
  type        = list(string)
  description = "Networks that are allowed to be accessed by ec2 instance on outbound connections"
}

variable "region" {
  type        = string
  description = "AWS region the IaC should be deployed into."
}

variable "tags" {
  type        = map(string)
  description = "Tags associated with resources."
}
