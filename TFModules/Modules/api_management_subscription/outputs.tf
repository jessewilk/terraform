output "apim_subscription_name" {
  value = azurerm_api_management_subscription.module.display_name
}
output "apim_subscription_id" {
  value = azurerm_api_management_subscription.module.id
}
output "apim_sub_all_attribs" {
  value = azurerm_api_management_subscription.module
}
