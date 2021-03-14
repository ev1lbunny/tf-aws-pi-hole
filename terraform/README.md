# Terraform Docs
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | ~> 3.0 |

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| pi_hole_open_vpn | ./pi-hole-open-vpn |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tags | Additional resource tags | `map(string)` | `{}` | no |
| aws\_credentials\_profile | High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment | `string` | n/a | yes |
| aws\_region | Region of aws to use | `string` | `"eu-west-2"` | no |
| enable\_separate\_openvpn\_instance | Boolean True/False to control the ec2 installs. Set to false if you dont want to build the openvpn instance. | `bool` | `false` | no |
| enable\_separate\_pihole\_instance | Boolean True/False to control the ec2 installs. Set to false if you dont want to build the pihole instance. | `bool` | `false` | no |
| ingress\_access\_ip\_address | Ip address that you will access the pihole from. All other access will be locked. | `string` | n/a | yes |
| key\_pair\_name | Name to give the generated keypair that will be associated with the pihole ec2 isntance for ssh access | `string` | `"server-keypair"` | no |
| pi\_hole\_web\_admin\_password | Password For accessing the Pihole gui admin console. Not really needed since security groups stop anyone but a single ip (your ip) from accessing it anyhow | `string` | `""` | no |
| split\_instances | Boolean True/False to control the ec2 installs. By default you will get 1 ec2 instance. Set to true and it will separate both OpenVPN and Pihole instances. Once split is true make sure you choose which intances to enable with the other vars. | `bool` | `false` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
