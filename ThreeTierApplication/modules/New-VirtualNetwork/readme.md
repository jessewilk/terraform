## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| addr\_space | virtual network address space - CIDR Block , example, 10.0.0.0/16 | list | - | yes |
| dns\_servers | dns servers to be configured with the virtual network | list | `<list>` | no |
| location | azure resource location | string | - | yes |
| resourceTags | A map of the tags to use on the resources that are deployed with this module | map | - | yes |
| resource\_group\_name | azure resource group name | string | - | yes |
| vnet\_name | azure virtual network name | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | - |
| name | - |

