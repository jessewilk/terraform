output "storage_name" {
  value = azurerm_storage_account.module.name
}
output "container_name" {
  value = azurerm_storage_container.module.name
}

output "primary_connection_string" {
  value     = azurerm_storage_account.module.primary_connection_string
  sensitive = true
}
output "primary_blob_endpoint" {
  value     = azurerm_storage_account.module.primary_blob_endpoint
  sensitive = true
}
output "primary_access_key" {
  value     = azurerm_storage_account.module.primary_access_key
  sensitive = true
}
