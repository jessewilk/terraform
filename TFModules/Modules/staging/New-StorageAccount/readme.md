## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access\_tier | access tier to use for storage acount.Valid values - Hot,Cool | string | `Hot` | no |
| account\_kind | kind of storage account.valid values - Storage, StorageV2, BlobStorage | string | `StorageV2` | no |
| account\_replication\_type | type of replication for storage account.valid values - LRS, GRS, RAGRS, ZRS | string | `LRS` | no |
| account\_tier | tier to use for storage acount.Valid values - Standard,Premium | string | `Standard` | no |
| enable\_https\_traffic\_only | boolean true or false.enables or disables account raffic encryption | string | `true` | no |
| encryption\_state | boolean true or false.this sets the storage account file and blob encryption state | string | `true` | no |
| location | Enter Resource group location | string | - | yes |
| resourceTags | A map of the tags to use on the resources that are deployed with this module. | map | - | yes |
| resource\_group\_name | Enter name for Azure Resource group | string | - | yes |
| storage\_account\_name | Enter name for storage account.All in lowercase.No Special characters. | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | - |
| primary\_access\_key | - |
| primary\_connection\_string | - |

