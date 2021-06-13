# terraform-aws-ec2-gatekeeper

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
| [aws_instance.gatekeeper](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.https_traffic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.outbound_traffic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.ssh_traffic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.amazon_linux_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_instance_profile.gk_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_instance_profile) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_general_ip_cidr_blocks_outbound"></a> [allowed\_general\_ip\_cidr\_blocks\_outbound](#input\_allowed\_general\_ip\_cidr\_blocks\_outbound) | Networks that are allowed to be accessed by ec2 instance on outbound connections | `list(string)` | n/a | yes |
| <a name="input_allowed_https_ip_cidr_blocks_inbound"></a> [allowed\_https\_ip\_cidr\_blocks\_inbound](#input\_allowed\_https\_ip\_cidr\_blocks\_inbound) | Networks that are allowed to access the ec2 instance via https (port 443) | `list(string)` | n/a | yes |
| <a name="input_allowed_ssh_ip_cidr_blocks_inbound"></a> [allowed\_ssh\_ip\_cidr\_blocks\_inbound](#input\_allowed\_ssh\_ip\_cidr\_blocks\_inbound) | Networks that are allowed to access the ec2 instance via ssh (port 22) | `list(string)` | n/a | yes |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | What instance type ec2 should adopt. t4g.micro is currently the smallest and cheapest gatekeeper can run on. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region the IaC should be deployed into. | `string` | n/a | yes |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Name of the ssh key pair used to ssh into the instance. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags associated with resources. | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
