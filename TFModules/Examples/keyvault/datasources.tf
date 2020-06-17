## Use this to do common stuff

## Get Tenant Id, Subscription Id, SPN Info
## https://www.terraform.io/docs/providers/azurerm/d/client_config.html
data "azurerm_client_config" "current" {
}

## Get Subscription Info
## https://www.terraform.io/docs/providers/azurerm/d/subscription.html
data "azurerm_subscription" "current" {
}

data "azuread_service_principal" "devops" {
  display_name = var.devops_spn_name
}

## Get the RG Info.  Also ensures that it exists.
data "azurerm_resource_group" "kv" {
  name = var.rg_name
}

