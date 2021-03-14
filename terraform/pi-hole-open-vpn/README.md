# Terraform Docs
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Modules

| Name | Source | Version |
|------|--------|---------|
| additional_pihole_instance_sg_rules | ./sg_rules |  |
| open_vpn_instance | ./instance_deployment |  |
| pi_hole_instance | ./instance_deployment |  |
| shared_instance | ./instance_deployment |  |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tags | Additional resource tags | `map(string)` | n/a | yes |
| aws\_credentials\_profile | High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment | `string` | n/a | yes |
| aws\_region | Region of aws to use | `string` | n/a | yes |
| enable\_separate\_openvpn\_instance | Boolean True/False to control the ec2 installs. Set to false if you dont want to build the openvpn instance. | `bool` | n/a | yes |
| enable\_separate\_pihole\_instance | Boolean True/False to control the ec2 installs. Set to false if you dont want to build the pihole instance. | `bool` | n/a | yes |
| ingress\_access\_ip\_address | Ip address that you will access the pihole from. All other access will be locked. | `string` | n/a | yes |
| key\_pair\_name | Name to give the generated keypair that will be associated with the pihole ec2 isntance for ssh access | `string` | n/a | yes |
| pi\_hole\_web\_admin\_password | Password For accessing the Pihole gui admin console. Not really needed since security groups stop anyone but a single ip (your ip) from accessing it anyhow | `string` | n/a | yes |
| split\_instances | Boolean True/False to control the ec2 installs. By default you will get 2 separate ec2 instances isolated and running independently. Set to false and it will consolidate both OpenVPN and Pihole into single EC2 | `bool` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| private\_generated\_key | The generated private key used to access the joint ec2 instances via ssh |
| public\_ip | Instance Public IP created |
| security\_group\_id | Secuirty Group Id |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
