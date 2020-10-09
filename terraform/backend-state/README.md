## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_credentials\_profile | High level profile name that the terraform uses for aws access to create new role/policy/user for pihole deployment | `string` | n/a | yes |
| aws\_dynamodb\_table\_name | Name for the backend state locking table | `string` | `"terraform-statelock"` | no |
| aws\_region | Region of aws to use | `string` | `"eu-west-2"` | no |
| aws\_s3\_state\_bucket\_name | Name for the backend state bucket | `string` | `"terraform-remotestate"` | no |

## Outputs

No output.
