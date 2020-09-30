## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| template | n/a |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_credentials\_profile | High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment | `string` | n/a | yes |
| aws\_region | Region of aws to use | `string` | `"eu-west-2"` | no |
| enable\_r53\_zone\_code | Boolean true/false flag that tells the terraform to run the route53 code if you have a zone setup already. If enabled remember to set r53\_zone variable too. | `bool` | `false` | no |
| ingress\_access\_ip\_address | Ip address that you will access the pihole from. All other access will be locked. | `string` | n/a | yes |
| key\_pair\_name | Name to give the generated keypair that will be associated with the ec2 isntance for ssh access | `string` | `"pi-hole-server-keypair"` | no |
| pi\_hole\_management\_role | Rolename created from the iam code used for managing the pi-hole instance | `string` | `"pi-hole-management-role"` | no |
| pi\_hole\_web\_admin\_password | Password For accessing the Pihole gui admin console. Not really needed since security groups stop anyone but a single ip (your ip) from accessing it anyhow | `string` | `""` | no |
| r53\_zone | Route 53 Zone | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| pihole | DNS Entry |
| public\_ip | Public IP created |

