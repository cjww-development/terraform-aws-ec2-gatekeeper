# terraform-aws-ec2-gatekeeper

## What is this repo?
This repo contains terraform IaC to deploy an EC2 instance to AWS and to deploy Gatekeeper inside docker on said EC2 instance behind and nginx reverse proxy.

To get this running create a `terraform.tfvars` containing values for the variables mentioned in the `inputs` section of this README.

## Example files
### example-nginx.conf
This file contains the nginx config that can be as is. Ensure the value of the `nginx_conf_file_path` is equal to the file path of this file.

### example-user-data.sh
This file contains the script that EC2 uses to initialise the instance. This includes the installation of docker, docker-compose, nginx and copying the appropriate files to the correct locations. Ensure the value of the `user_data_file_path` is equal to the file path of this file.

### example-docker-compose.yml
This file contains an example of what docker-compose will use to boot Gatekeeper inside of EC2 change the values in the environment block to what you need them to be. Ensure the value of the `docker_compose_file_path` is equal to the file path of this file.

## Generating SSL certificates
The easiest way to generate an SSL cert is to use certbot with letsencrypt.

To generate a cert run the following command
```shell
sudo certbot --manual --preferred-challenges dns certonly -d gatekeeper.your-domain.com
```

Deploy the TXT record it tells you to your domains DNS servers.

Once this is in place. Point the following variables to your certificates locations.

- ssl_cert_file_path
- ssl_cert_key_file_path
- ssl_options_file_path
- ssl_dhparams_file_path

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_subnet.default_subnet_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_subnet) | resource |
| [aws_eip.gatekeeper](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_iam_instance_profile.gk_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.gk_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_instance.gatekeeper](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_s3_bucket.gatekeeper_resources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_object.docker_compose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.nginx_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.ssl_cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.ssl_cert_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.ssl_dhparams](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.ssl_options](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_public_access_block.gatekeeper_resources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_security_group.https_traffic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.outbound_traffic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.amazon_linux_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_policy_document.gatekeeper_resources_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.gk_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_general_ip_cidr_blocks_outbound"></a> [allowed\_general\_ip\_cidr\_blocks\_outbound](#input\_allowed\_general\_ip\_cidr\_blocks\_outbound) | Networks that are allowed to be accessed by ec2 instance on outbound connections | `list(string)` | n/a | yes |
| <a name="input_allowed_https_ip_cidr_blocks_inbound"></a> [allowed\_https\_ip\_cidr\_blocks\_inbound](#input\_allowed\_https\_ip\_cidr\_blocks\_inbound) | Networks that are allowed to access the ec2 instance via https (port 443) | `list(string)` | n/a | yes |
| <a name="input_docker_compose_file_path"></a> [docker\_compose\_file\_path](#input\_docker\_compose\_file\_path) | Path to the docker compose file to boot Gatekeeper | `string` | n/a | yes |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | What instance type ec2 should adopt. t3a.micro is currently the smallest and cheapest gatekeeper can run on. | `string` | n/a | yes |
| <a name="input_force_bucket_destroy"></a> [force\_bucket\_destroy](#input\_force\_bucket\_destroy) | Force the destruction of the bucket and ALL data therein | `bool` | n/a | yes |
| <a name="input_nginx_conf_file_path"></a> [nginx\_conf\_file\_path](#input\_nginx\_conf\_file\_path) | File path to the nginx conf file | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region the IaC should be deployed into. | `string` | n/a | yes |
| <a name="input_resources_bucket_name"></a> [resources\_bucket\_name](#input\_resources\_bucket\_name) | Name of the S3 bucket that holds Gatekeepers required files | `string` | n/a | yes |
| <a name="input_ssl_cert_file_path"></a> [ssl\_cert\_file\_path](#input\_ssl\_cert\_file\_path) | File path to ssl cert. Generally lives under /etc/letsencrypt/live/your-domain.com/fullchain.pem | `string` | n/a | yes |
| <a name="input_ssl_cert_key_file_path"></a> [ssl\_cert\_key\_file\_path](#input\_ssl\_cert\_key\_file\_path) | File path to ssl cert key. Generally lives under /etc/letsencrypt/live/your-domain.com/privkey.pem | `string` | n/a | yes |
| <a name="input_ssl_dhparams_file_path"></a> [ssl\_dhparams\_file\_path](#input\_ssl\_dhparams\_file\_path) | File path to ssl dhparams file. Generally lives under /etc/letsencrypt/ssl-dhparams.pem | `string` | n/a | yes |
| <a name="input_ssl_options_file_path"></a> [ssl\_options\_file\_path](#input\_ssl\_options\_file\_path) | File path to ssl options file. Generally lives under /etc/letsencrypt/options-ssl-nginx.conf | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags associated with resources. | `map(string)` | n/a | yes |
| <a name="input_user_data_file_path"></a> [user\_data\_file\_path](#input\_user\_data\_file\_path) | File path to EC2 user data file | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gatekeeper_instance_arn"></a> [gatekeeper\_instance\_arn](#output\_gatekeeper\_instance\_arn) | ARN of the created instance |
| <a name="output_gatekeeper_instance_id"></a> [gatekeeper\_instance\_id](#output\_gatekeeper\_instance\_id) | Id of the created instance |
| <a name="output_gatekeeper_instance_public_dns"></a> [gatekeeper\_instance\_public\_dns](#output\_gatekeeper\_instance\_public\_dns) | Public DNS of the created instance |
| <a name="output_gatekeeper_instance_public_ip"></a> [gatekeeper\_instance\_public\_ip](#output\_gatekeeper\_instance\_public\_ip) | Public IP of the created instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

License
=======
This code is open sourced licensed under the Apache 2.0 License
