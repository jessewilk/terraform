output "access_policy_id" {
  value = azurerm_key_vault_access_policy.module[*].id
}

output "access_policy_all_attribs" {
  value = azurerm_key_vault_access_policy.module[*]
}
