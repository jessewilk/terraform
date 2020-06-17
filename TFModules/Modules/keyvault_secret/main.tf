resource "azurerm_key_vault_secret" "module" {
  name         = var.keyvault_secret_name
  value        = var.keyvault_secret_value
  key_vault_id = var.keyvault_id

  tags = var.keyvault_secret_tags

  lifecycle {
    create_before_destroy = true
  }
}
