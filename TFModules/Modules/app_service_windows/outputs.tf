output "web_app_name" {
  value = azurerm_app_service.module.name
}
output "web_app_id" {
  value = azurerm_app_service.module.id
}
output "web_app_default_site_hostname" {
  value = azurerm_app_service.module.default_site_hostname
}
