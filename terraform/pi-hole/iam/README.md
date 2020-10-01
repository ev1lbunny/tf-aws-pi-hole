## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| aws | ~> 2.50.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.50.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_credentials\_profile | High level rofile name that the terraform uses for aws access to create new role/policy/user for pihole deployment | `any` | n/a | yes |
| aws\_region | Region of aws to use | `string` | `"eu-west-2"` | no |
| pi\_hole\_management\_role | Rolename created from the iam code used for managing the pi-hole instance | `string` | `"pi-hole-management-role"` | no |

## Outputs

No output.

