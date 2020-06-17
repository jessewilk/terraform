# Create two keyvaults in the same resource group

## Create vault using resource group's location
module "demo_keyvault" {
  source                       = "../../Modules/key_vault"
  keyvault_name                = var.demo_kv_name
  rg_name                      = data.azurerm_resource_group.kv.name
  keyvault_location            = data.azurerm_resource_group.kv.location
  tenant_id                    = data.azurerm_client_config.current.tenant_id
  object_id                    = data.azuread_service_principal.devops.id
  keyvault_key_permissions     = var.keyvault_admin_key_permissions
  keyvault_secret_permissions  = var.keyvault_admin_secret_permissions
  keyvault_cert_permissions    = var.keyvault_admin_cert_permissions
  keyvault_storage_permissions = var.keyvault_admin_storage_permissions
  keyvault_tags                = var.keyvault_tags
}

## Create vault using specified location
module "myapp_keyvault" {
  source                       = "../../Modules/key_vault"
  keyvault_name                = var.myapp_kv_name
  rg_name                      = data.azurerm_resource_group.kv.name
  keyvault_location            = var.rg_location
  tenant_id                    = data.azurerm_client_config.current.tenant_id
  object_id                    = data.azuread_service_principal.devops.id
  keyvault_key_permissions     = var.keyvault_admin_key_permissions
  keyvault_secret_permissions  = var.keyvault_admin_secret_permissions
  keyvault_cert_permissions    = var.keyvault_admin_cert_permissions
  keyvault_storage_permissions = var.keyvault_admin_storage_permissions
  keyvault_tags                = var.keyvault_tags
}

