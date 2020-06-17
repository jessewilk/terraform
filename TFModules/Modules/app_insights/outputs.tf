output "appinsights_name" {
  value = azurerm_application_insights.module.name
}
output "appinsights_id" {
  value = azurerm_application_insights.module.id
}
output "appinsights_app_id" {
  value = azurerm_application_insights.module.app_id
}
output "appinsights_instrumentation_key" {
  value     = azurerm_application_insights.module.instrumentation_key
  sensitive = true
}
