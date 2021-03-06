#git@ssh.dev.azure.com:v3/BlueMetal/TenentHealthCare/Azure_IaC
#git::https://dev.azure.com/BlueMetal/TenentHealthCare/_git/Azure_IaC/Modules/key_vault
module "demo_keyvault" {
  #source                       = "git::https://dev.azure.com/BlueMetal/TenentHealthCare/_git/Azure_IaC//Modules/key_vault"
  #  source                       = "https://BlueMetal@dev.azure.com/BlueMetal/TenentHealthCare/_git/Azure_IaC/Modules/key_vault"
  source                       = "../../Modules/keyvault"
  keyvault_name                = var.demo_kv_name
  rg_name                      = data.azurerm_resource_group.kv.name
  keyvault_location            = data.azurerm_resource_group.kv.location
  tenant_id                    = data.azurerm_client_config.current.tenant_id
  object_id                    = data.azuread_service_principal.devops.id
  keyvault_key_permissions     = var.keyvault_admin_key_permissions
  keyvault_secret_permissions  = var.keyvault_admin_secret_permissions
  keyvault_cert_permissions    = var.keyvault_admin_cert_permissions
  keyvault_storage_permissions = var.keyvault_admin_storage_permissions
  keyvault_tags                = local.tags #data.azurerm_resource_group.kv.tags
}

# module "demo_access_policy" {
#   source                       = "../../Modules/keyvault_access_policy"
#   keyvault_id                  = module.demo_keyvault.keyvault_id
#   tenant_id                    = data.azurerm_client_config.current.tenant_id
#   user_objectid_list           = local.admin_object_id_list
# #  user_objectid_list           = var.adminuser_objectid_list
#   keyvault_key_permissions     = var.keyvault_admin_key_permissions
#   keyvault_secret_permissions  = var.keyvault_admin_secret_permissions
#   keyvault_cert_permissions    = var.keyvault_admin_cert_permissions
#   keyvault_storage_permissions = var.keyvault_admin_storage_permissions
# }
