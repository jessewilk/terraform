## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| appgw\_backend\_port | application gateway backend port | string | `80` | no |
| appgw\_backend\_portocol | application gateway backend portocol.valid values, Http,Https | string | `Http` | no |
| appgw\_capacity | capacity of the sku to be used in the application gateway, value must be between 1 and 10 | string | `2` | no |
| appgw\_frontend\_port | application gateway frontend port | string | `80` | no |
| appgw\_frontend\_portocol | application gateway frontend listener protocol.valid values, Http,Https | string | `Http` | no |
| appgw\_frontend\_type | application gateway frontend type, possible values internal,external | string | - | yes |
| appgw\_name\_prefix | application gateway name prefix | string | - | yes |
| appgw\_sku | application gateway sku,possible values Standard_Small,Standard_Medium,Standard_Large,WAF_Medium,WAF_Large | string | - | yes |
| appgw\_tier | the tier for application gateway sku,possible values are Standard, Standard_v2, WAF and WAF_v2 | string | - | yes |
| location | resource location | string | - | yes |
| pip\_id | public ip address name to associate with the application gateway frontend | string | - | yes |
| request\_timeout | backend request timeout value in seconds. valid values can be in the range of 1 to 86400 | string | `1` | no |
| resourceTags | A map of the tags to use on the resources that are deployed with this module. | map | - | yes |
| resource\_group\_name | azure resource group name | string | - | yes |
| subnet\_name | subnet name to associate with the application gateway backend | string | - | yes |
| vnet\_name | name of virtual network to associate with the application gateway backend | string | - | yes |
| vnet\_resource\_group | virtual network resource group name | string | - | yes |

