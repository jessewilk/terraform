output "keyvault_name" {
  value = azurerm_key_vault.module.name
}

output "keyvault_id" {
  value = azurerm_key_vault.module.id
}

output "keyvault_uri" {
  value = azurerm_key_vault.module.vault_uri
}

output "keyvault_all_attribs" {
  value = azurerm_key_vault.module
}
