## Use this to do common stuff

## Get Tenant Id, Subscription Id, SPN Info
## https://www.terraform.io/docs/providers/azurerm/d/client_config.html
data "azurerm_client_config" "current" {
}

## Get Subscription Info
## https://www.terraform.io/docs/providers/azurerm/d/subscription.html
data "azurerm_subscription" "current" {
}

## Get the RG Info.  Also ensures that it exists.
data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

data "azurerm_api_management" "apim" {
  name                = var.apim_name
  resource_group_name = var.rg_name
}

data "azurerm_api_management_user" "apim" {
  user_id             = "11111111-1111-1111-1111-111111111111"
  api_management_name = data.azurerm_api_management.apim.name
  resource_group_name = data.azurerm_api_management.apim.resource_group_name
}

data "azurerm_api_management_product" "apim" {
  product_id          = "00000000-0000-0000-0000-000000000000"
  api_management_name = data.azurerm_api_management.apim.name
  resource_group_name = data.azurerm_api_management.apim.resource_group_name
}