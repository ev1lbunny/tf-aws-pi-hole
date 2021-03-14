# Terraform Docs
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |
| tls | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) |
| [aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) |
| [aws_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) |
| [template_file](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) |
| [tls_private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tags | Additional resource tags | `map(string)` | n/a | yes |
| aws\_credentials\_profile | High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment | `string` | n/a | yes |
| aws\_region | Region of aws to use | `string` | n/a | yes |
| ingress\_access\_ip\_address | Ip address that you will access the instance from. All other access will be locked. | `string` | n/a | yes |
| instance\_ami\_id | Requested Instance Ami Image Id | `string` | `"ami-05c424d59413a2876"` | no |
| instance\_hostname | Requested Instance Hostname | `string` | n/a | yes |
| instance\_type | Requested Instance Type | `string` | n/a | yes |
| instance\_volume\_size | Requested Instance Volume Size | `number` | n/a | yes |
| key\_pair\_name | Name to give the generated keypair that will be associated with the ec2 isntance for ssh access | `string` | n/a | yes |
| pi\_hole\_web\_admin\_password | Password For accessing the Pihole gui admin console. Not really needed since security groups stop anyone but a single ip (your ip) from accessing it anyhow | `string` | `""` | no |
| prefix\_identifier | Prefix added to all resources in aws to differentiate between types of infra setup | `string` | n/a | yes |
| user\_data\_template | User Data that the ec2 instance will run post creation | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| private\_generated\_key | The generated private key used to access the joint ec2 instances via ssh |
| public\_ip | Instance Public IP created |
| security\_group\_id | Secuirty Group Id |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
