## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| location | azure resource location | string | - | yes |
| nic\_name | azure network interface name | string | - | yes |
| private\_ip\_address | private ip address to be assigned to the nic.keep it blank for dynamic ip assignment | string | `` | no |
| private\_ip\_address\_allocation | how a private ip address will be assigned to nic, valid values - Static,Dynamic | string | - | yes |
| resourceTags | A map of the tags to use on the resources that are deployed with this module | map | - | yes |
| resource\_group\_name | azure resource group name | string | - | yes |
| subnet\_name | azure subnet name | string | - | yes |
| vnet\_name | azure virtual network name | string | - | yes |
| vnet\_resource\_group | azure virtual network resource group name | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | - |
| mac\_address | - |
| private\_ip\_address | - |

