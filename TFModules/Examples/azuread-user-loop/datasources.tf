## Use this to do common stuff

## Get Tenant Id, Subscription Id, SPN Info
## https://www.terraform.io/docs/providers/azurerm/d/client_config.html
data "azurerm_client_config" "current" {
}

## Get Subscription Info
## https://www.terraform.io/docs/providers/azurerm/d/subscription.html
data "azurerm_subscription" "current" {
}

## https://www.terraform.io/docs/providers/azuread/d/user.html
data "azuread_user" "admin" {
  count = length(var.admin_email_list)

  user_principal_name = var.admin_email_list[count.index]
}
