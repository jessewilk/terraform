output "apim_name" {
  value = azurerm_api_management.module.name
}
output "apim_id" {
  value = azurerm_api_management.module.id
}
output "apim_gateway_url" {
  description = "The URL of the Gateway for the API Management Service."
  value       = azurerm_api_management.module.gateway_url
}
output "apim_gateway_regional_url" {
  description = "The Regional URL of the Gateway for the API Management Service."
  value       = azurerm_api_management.module.gateway_regional_url
}
output "apim_management_api_url" {
  description = "The URL for the Management API associated with this API Management service."
  value       = azurerm_api_management.module.management_api_url
}
output "apim_portal_url" {
  description = "The URL for the Publisher Portal associated with this API Management service."
  value       = azurerm_api_management.module.portal_url
}
