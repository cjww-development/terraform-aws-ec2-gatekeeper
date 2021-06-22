resource "aws_s3_bucket_object" "nginx_config" {
  bucket                 = aws_s3_bucket.gatekeeper_resources.id
  key                    = "nginx/nginx.conf"
  source                 = var.nginx_conf_file_path
  etag                   = filemd5(var.nginx_conf_file_path)
  server_side_encryption = "AES256"
}

resource "aws_s3_bucket_object" "docker_compose" {
  bucket                 = aws_s3_bucket.gatekeeper_resources.id
  key                    = "docker/docker-compose.yml"
  source                 = var.docker_compose_file_path
  etag                   = filemd5(var.docker_compose_file_path)
  server_side_encryption = "AES256"
}

resource "aws_s3_bucket_object" "ssl_cert" {
  bucket                 = aws_s3_bucket.gatekeeper_resources.id
  key                    = "ssl/fullchain.pem"
  source                 = var.ssl_cert_file_path
  etag                   = filemd5(var.ssl_cert_file_path)
  server_side_encryption = "AES256"
}

resource "aws_s3_bucket_object" "ssl_cert_key" {
  bucket                 = aws_s3_bucket.gatekeeper_resources.id
  key                    = "ssl/privkey.pem"
  source                 = var.ssl_cert_key_file_path
  etag                   = filemd5(var.ssl_cert_key_file_path)
  server_side_encryption = "AES256"
}

resource "aws_s3_bucket_object" "ssl_options" {
  bucket                 = aws_s3_bucket.gatekeeper_resources.id
  key                    = "ssl/options-ssl-nginx.conf"
  source                 = var.ssl_options_file_path
  etag                   = filemd5(var.ssl_options_file_path)
  server_side_encryption = "AES256"
}

resource "aws_s3_bucket_object" "ssl_dhparams" {
  bucket                 = aws_s3_bucket.gatekeeper_resources.id
  key                    = "ssl/ssl-dhparams.pem"
  source                 = var.ssl_dhparams_file_path
  etag                   = filemd5(var.ssl_dhparams_file_path)
  server_side_encryption = "AES256"
}
