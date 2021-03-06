## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create\_option | create options for azure managed disk.valid values - Import,Empty,Copy,FromImage | string | `Empty` | no |
| disk\_name | azure managed disk name | string | - | yes |
| disk\_size\_gb | azure managed disk size in GB | string | `500` | no |
| image\_reference\_id | id of an existing platform/marketplace disk image to copy when create option is FromImage | string | `` | no |
| location | azure resource location | string | - | yes |
| resourceTags | A map of the tags to use on the resources that are deployed with this module | map | - | yes |
| resource\_group\_name | azure resource group name | string | - | yes |
| source\_resource\_id | id of an existing managed disk to copy when create option is Copy | string | `` | no |
| source\_uri | uri to a valid vhd file to be used when create option is Import | string | `` | no |
| storage\_account\_type | type of storage account to use for the managed disk.valid values - Premium_LRS, Standard_LRS | string | `Standard_LRS` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | - |

