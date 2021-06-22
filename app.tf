//
//provider "docker" {
//  host = "tcp://${aws_eip.gatekeeper.public_ip}:2376/"
//}
//
//resource "docker_image" "gatekeeper" {
//  name = "cjwwdevelopment/gatekeeper:${var.gatekeeper_version}"
//}
//
//resource "docker_container" "gatekeeper" {
//  image   = docker_image.gatekeeper.latest
//  name    = "gatekeeper"
//  restart = "always"
//  ports {
//    internal = 80
//    external = 5678
//  }
//  env = [
//    "VERSION=${var.gatekeeper_version}",
//    "EMAIL_FROM=${var.email_from_address}",
//    "MONGO_URI=${var.mongo_uri}",
//    "APP_SECRET=${var.application_secret}",
//    "ENC_KEY=${var.encryption_key}",
//    "MFA_ISSUER=${var.mfa_issuer}",
//    "SMS_SENDER_ID=${var.sms_sender_id}",
//    "WKC_ISSUER=${var.wkc_issuer}",
//  ]
//}
