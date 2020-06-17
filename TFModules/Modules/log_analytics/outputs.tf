output "log_analytics_name" {
  value = azurerm_log_analytics_workspace.module.name
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.module.id
}

output "log_analytics_location" {
  value = azurerm_log_analytics_workspace.module.location
}

output "log_analytics_portal_url" {
  value = azurerm_log_analytics_workspace.module.portal_url
}

output "log_analytics_shared_key" {
  value     = azurerm_log_analytics_workspace.module.primary_shared_key
  sensitive = true
}

