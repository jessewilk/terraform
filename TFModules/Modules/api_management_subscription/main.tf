resource "azurerm_api_management_subscription" "module" {
  api_management_name = var.apim_name
  resource_group_name = var.rg_name

  user_id      = var.apim_user_id
  product_id   = var.apim_product_id
  display_name = var.subscription_display_name
}
