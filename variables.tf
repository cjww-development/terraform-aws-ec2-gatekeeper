variable "ec2_instance_type" {
  type        = string
  description = "What instance type ec2 should adopt. t3a.micro is currently the smallest and cheapest gatekeeper can run on."
}

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

variable "allowed_docker_socket_ip_cidr_blocks_inbound" {
  type        = list(string)
  description = "Networks that are allowed to access the ec2 instance via docker (port 2376)"
}

variable "region" {
  type        = string
  description = "AWS region the IaC should be deployed into."
}

variable "tags" {
  type        = map(string)
  description = "Tags associated with resources."
}

variable "resources_bucket_name" {
  type        = string
  description = "Name of the S3 bucket that holds Gatekeepers required files"
}

variable "force_bucket_destroy" {
  type        = bool
  description = "Force the destruction of the bucket and ALL data therein"
}

variable "docker_compose_file_path" {
  type        = string
  description = "Path to the docker compose file to boot Gatekeeper"
}

variable "ssl_cert_file_path" {
  type        = string
  description = "File path to ssl cert. Generally lives under /etc/letsencrypt/live/your-domain.com/fullchain.pem"
}

variable "ssl_cert_key_file_path" {
  type        = string
  description = "File path to ssl cert key. Generally lives under /etc/letsencrypt/live/your-domain.com/privkey.pem"
}

variable "ssl_options_file_path" {
  type        = string
  description = "File path to ssl options file. Generally lives under /etc/letsencrypt/options-ssl-nginx.conf"
}

variable "ssl_dhparams_file_path" {
  type        = string
  description = "File path to ssl dhparams file. Generally lives under /etc/letsencrypt/ssl-dhparams.pem"
}

variable "nginx_conf_file_path" {
  type        = string
  description = "File path to the nginx conf file"
}

variable "user_data_file_path" {
  type        = string
  description = "File path to EC2 user data file"
}
