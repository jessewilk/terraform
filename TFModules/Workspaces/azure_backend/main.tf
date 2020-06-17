# Vnet
# subnet
# app config
# Storage Acct
# Key vault

module "devops_vnet" {
  source        = "../../Modules/vnet"
  vnet_name     = local.vnet_name
  rg_name       = data.azurerm_resource_group.rg.name
  vnet_location = data.azurerm_resource_group.rg.location

  vnet_address_space = var.vnet_address_space

  vnet_tags = local.common_tags
}

module "devops_subnet" {
  source      = "../../Modules/subnet"
  vnet_name   = module.devops_vnet.vnet_name
  subnet_name = var.subnet_name
  rg_name     = data.azurerm_resource_group.rg.name

  subnet_address_prefix = var.subnet_address_prefix
  service_endpoints     = var.service_endpoints

  subnet_tags = local.common_tags
}

module "devops_keyvault" {
  source            = "../../Modules/keyvault"
  keyvault_name     = local.keyvault_name
  rg_name           = data.azurerm_resource_group.rg.name
  keyvault_location = data.azurerm_resource_group.rg.location

  tenant_id                    = data.azurerm_client_config.current.tenant_id
  object_id                    = data.azuread_service_principal.devops.id
  keyvault_key_permissions     = var.keyvault_admin_key_permissions
  keyvault_secret_permissions  = var.keyvault_admin_secret_permissions
  keyvault_cert_permissions    = var.keyvault_admin_cert_permissions
  keyvault_storage_permissions = var.keyvault_admin_storage_permissions

  virtual_network_subnet_ids = [module.devops_subnet.subnet_id]

  keyvault_tags = local.common_tags
}

module "devops_blob_container" {
  source = "../../Modules/storage_container"

  storage_name     = local.storageacct_name
  rg_name          = data.azurerm_resource_group.rg.name
  storage_location = data.azurerm_resource_group.rg.location

  storage_tier          = var.storage_tier
  storage_repl_type     = var.storage_repl_type
  container_name        = var.container_name
  container_access_type = var.container_access_type

  storage_tags = local.common_tags
}

module "devops_storage_vnet_rules" {
  source = "../../Modules/storage_vnet_rules"

  storage_name = module.devops_blob_container.storage_name
  rg_name      = data.azurerm_resource_group.rg.name

  storage_net_default_action = var.storage_net_default_action
  storage_net_subnet_ids     = [module.devops_subnet.subnet_id]
  storage_net_bypass         = var.storage_net_bypass
}

module "devops_app_config" {
  source              = "../../Modules/app_configuration"
  app_config_name     = local.app_config_name
  rg_name             = data.azurerm_resource_group.rg.name
  app_config_location = data.azurerm_resource_group.rg.location

  app_config_sku  = var.app_config_sku
  app_config_tags = local.common_tags
}

