## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | ~> 3.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tags | Additional resource tags | `map(string)` | `{}` | no |
| aws\_credentials\_profile | High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment | `string` | n/a | yes |
| aws\_region | Region of aws to use | `string` | `"eu-west-2"` | no |
| enable\_r53\_zone\_code | Boolean true/false flag that tells the terraform to run the route53 code if you have a zone setup already. If enabled remember to set r53\_zone variable too. | `bool` | `false` | no |
| ingress\_access\_ip\_address | Ip address that you will access the pihole from. All other access will be locked. | `string` | n/a | yes |
| open\_vpn\_key\_pair\_name | Name to give the generated keypair that will be associated with the open vpn ec2 isntance for ssh access | `string` | `"open-vpn-server-keypair"` | no |
| pi\_hole\_key\_pair\_name | Name to give the generated keypair that will be associated with the pihole ec2 isntance for ssh access | `string` | `"pi-hole-server-keypair"` | no |
| pi\_hole\_web\_admin\_password | Password For accessing the Pihole gui admin console. Not really needed since security groups stop anyone but a single ip (your ip) from accessing it anyhow | `string` | `""` | no |
| r53\_zone | Route 53 Zone | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| open\_vpn\_public\_ip | OpenVPN Public IP created |
| open\_vpn\_r53\_entries | OpenVPN DNS Entries |
| pi\_hole\_public\_ip | Pi Hole Public IP created |
| pi\_hole\_r53\_entries | Pi Hole DNS Entries |

