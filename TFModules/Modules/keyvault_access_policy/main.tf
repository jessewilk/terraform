resource "azurerm_key_vault_access_policy" "module" {
  key_vault_id = var.keyvault_id

  tenant_id = var.tenant_id

  count     = length(var.user_objectid_list)
  object_id = var.user_objectid_list[count.index]

  key_permissions         = var.keyvault_key_permissions
  secret_permissions      = var.keyvault_secret_permissions
  certificate_permissions = var.keyvault_cert_permissions
  storage_permissions     = var.keyvault_storage_permissions

  # lifecycle {
  #   create_before_destroy = true
  # }
}

