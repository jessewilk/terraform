## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain\_name | name of windows active directory domain to join the vm | string | - | yes |
| domain\_user\_name | domain user name with rights to add a computer object to domain | string | - | yes |
| domain\_user\_password | domain user password to add a computer object to domain | string | - | yes |
| location | azure resource location | string | - | yes |
| ou\_name | name of active directory ou to place the vm.example,OU=ServerOU; DC=MyDomain; DC=com | string | - | yes |
| resourceTags | A map of the tags to use on the resources that are deployed with this module | map | - | yes |
| resource\_group\_name | azure resource group name | string | - | yes |
| vm\_name | azure virtual machine name | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | - |

