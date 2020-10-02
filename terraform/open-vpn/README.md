## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tags | Additional resource tags | `map(string)` | n/a | yes |
| aws\_credentials\_profile | High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment | `string` | n/a | yes |
| aws\_region | Region of aws to use | `string` | n/a | yes |
| enable\_r53\_zone\_code | Boolean true/false flag that tells the terraform to run the route53 code if you have a zone setup already. If enabled remember to set r53\_zone variable too. | `bool` | n/a | yes |
| ingress\_access\_ip\_address | Ip address that you will access the openvpn from. All other access will be locked. | `string` | n/a | yes |
| open\_vpn\_key\_pair\_name | Name to give the generated keypair that will be associated with the open vpn ec2 isntance for ssh access | `string` | n/a | yes |
| r53\_zone | Route 53 Zone | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| private\_ip | OpenVPN Private IP created |
| public\_ip | OpenVPN Public IP created |
| r53\_entry | DNS Entry |

