output "app_config_name" {
  value = azurerm_app_configuration.module.name
}
output "app_config_id" {
  value = azurerm_app_configuration.module.id
}
output "app_config_endpoint" {
  value = azurerm_app_configuration.module.endpoint
}
output "app_config_write_key" {
  value     = azurerm_app_configuration.module.primary_write_key
  sensitive = true
}
output "app_config_read_key" {
  value     = azurerm_app_configuration.module.primary_read_key
  sensitive = true
}
