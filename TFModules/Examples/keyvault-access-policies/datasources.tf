## Use this to do common stuff

## Get Tenant Id, Subscription Id, SPN Info
## https://www.terraform.io/docs/providers/azurerm/d/client_config.html
data "azurerm_client_config" "current" {
}

## Get Subscription Info
## https://www.terraform.io/docs/providers/azurerm/d/subscription.html
data "azurerm_subscription" "current" {
}

data "azurerm_key_vault" "example" {
  name                = var.keyvault_name
  resource_group_name = var.rg_name
}
