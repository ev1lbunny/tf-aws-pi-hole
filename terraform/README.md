## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| aws | ~> 2.50.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.50.0 |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_credentials\_profile | High level rofile name that the terraform uses for aws access to create new role/policy/user for pihole deployment | `any` | n/a | yes |
| aws\_region | Region of aws to use | `string` | `"eu-west-2"` | no |
| ingress\_access\_ip\_address | Ip address that you will access the pihole from. All other access will be locked. | `any` | n/a | yes |
| key\_pair\_name | Name to give the generated keypair that will be associated with the ec2 isntance for ssh access | `string` | `"pi-hole-server-keypair"` | no |
| pi\_hole\_management\_role | Rolename created from the iam code used for managing the pi-hole instance | `string` | `"pi-hole-management-role"` | no |

## Outputs

No output.

