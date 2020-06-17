output "keyvault_secret_name" {
  value = azurerm_key_vault_secret.module.name
}
output "keyvault_secret_id" {
  value = azurerm_key_vault_secret.module.id
}
