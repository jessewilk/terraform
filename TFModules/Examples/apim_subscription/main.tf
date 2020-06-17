module "demo_apim_subscription" {
  source = "../../Modules/api_management_subscription"

  rg_name   = data.azurerm_api_management.apim.resource_group_name
  apim_name = data.azurerm_api_management.apim.name

  apim_user_id              = data.azurerm_api_management_user.apim.id
  apim_product_id           = data.azurerm_api_management_product.apim.id
  subscription_display_name = var.subscription_display_name
}
