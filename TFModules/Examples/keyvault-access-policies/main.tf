module "demo_access_policy" {
  source             = "../../Modules/keyvault_access_policy"
  keyvault_id        = data.azurerm_key_vault.example.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  user_objectid_list = var.admin_objectid_list
  //  user_email_list = var.admin_email_list

  keyvault_key_permissions     = var.keyvault_admin_key_permissions
  keyvault_secret_permissions  = var.keyvault_admin_secret_permissions
  keyvault_cert_permissions    = var.keyvault_admin_cert_permissions
  keyvault_storage_permissions = var.keyvault_admin_storage_permissions
}
