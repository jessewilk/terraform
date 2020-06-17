module "demo_vnet" {
  source        = "../../Modules/vnet"
  vnet_name     = var.vnet_name
  rg_name       = data.azurerm_resource_group.rg.name
  vnet_location = data.azurerm_resource_group.rg.location

  vnet_address_space = var.vnet_address_space

  vnet_tags = var.vnet_tags
}

module "demo_subnet1" {
  source      = "../../Modules/subnet"
  vnet_name   = module.demo_vnet.vnet_name
  subnet_name = var.subnet1_name
  rg_name     = data.azurerm_resource_group.rg.name

  subnet_address_prefix = var.subnet1_address_prefix

  subnet_tags = var.vnet_tags
}

module "demo_subnet2" {
  source      = "../../Modules/subnet"
  vnet_name   = module.demo_vnet.vnet_name
  subnet_name = var.subnet2_name
  rg_name     = data.azurerm_resource_group.rg.name

  subnet_address_prefix = var.subnet2_address_prefix

  service_endpoints = var.service_endpoints

  subnet_tags = var.vnet_tags
}

module "demo_keyvault" {
  source            = "../../Modules/keyvault"
  keyvault_name     = var.demo_kv_name
  rg_name           = data.azurerm_resource_group.rg.name
  keyvault_location = data.azurerm_resource_group.rg.location

  tenant_id                    = data.azurerm_client_config.current.tenant_id
  object_id                    = data.azuread_service_principal.devops.id
  keyvault_key_permissions     = var.keyvault_admin_key_permissions
  keyvault_secret_permissions  = var.keyvault_admin_secret_permissions
  keyvault_cert_permissions    = var.keyvault_admin_cert_permissions
  keyvault_storage_permissions = var.keyvault_admin_storage_permissions

  virtual_network_subnet_ids = [module.demo_subnet2.subnet_id]

  keyvault_tags = var.vnet_tags
}

module "demo_sql_server" {
  source = "../../Modules/sql_server"

  sql_server_name     = var.sql_server_name
  rg_name             = data.azurerm_resource_group.rg.name
  sql_server_location = data.azurerm_resource_group.rg.location

  sql_admin_login = var.sql_admin_login

  sql_server_tags = local.tags
}

module "demo_sql_server_dbs" {
  source = "../../Modules/sql_database"

  sql_server_name = module.demo_sql_server.sql_server_name
  rg_name         = data.azurerm_resource_group.rg.name
  sql_db_location = data.azurerm_resource_group.rg.location

  sql_db_list = var.sql_db_list

  sql_db_tags = var.sql_db_tags
}

module "demo_sql_vnet_rule" {
  source = "../../Modules/sql_vnet_rule"

  sql_vnet_rule_name = var.sql_vnet_rule_name
  rg_name            = data.azurerm_resource_group.rg.name
  sql_server_name    = module.demo_sql_server.sql_server_name
  subnet_id          = module.demo_subnet2.subnet_id
}

module "demo_blob_container" {
  source = "../../Modules/storage_container"

  storage_name     = var.storageacct_name
  rg_name          = data.azurerm_resource_group.rg.name
  storage_location = data.azurerm_resource_group.rg.location

  storage_tier          = var.storage_tier
  storage_repl_type     = var.storage_repl_type
  container_name        = var.container_name
  container_access_type = var.container_access_type

  storage_tags = local.tags
}

module "demo_storage_vnet_rules" {
  source = "../../Modules/storage_vnet_rules"

  storage_name = module.demo_blob_container.storage_name
  rg_name      = data.azurerm_resource_group.rg.name

  storage_net_default_action = var.storage_net_default_action
  storage_net_subnet_ids     = [module.demo_subnet2.subnet_id]
  storage_net_bypass         = var.storage_net_bypass
}

module "demo_appinsights" {
  source = "../../Modules/app_insights"

  rg_name              = data.azurerm_resource_group.rg.name
  appinsights_name     = var.appinsights_name
  appinsights_location = data.azurerm_resource_group.rg.location

  appinsights_tags = local.tags
}


#*******************************
# LEAVE BELOW COMMENTED CODE HERE.  POSSIBLE FUTURE USE.
# Func App and app service don't currently attach to vnet, even though terraform log says it works.data
# Solution will probably be to hook both to APIM, which will be connected to Vnet.data
#*******************************

# module "demo_app_service_plan" {
#   source = "../../Modules/app_service_plan_dedicated"

#   app_plan_name     = var.app_plan_name
#   rg_name           = data.azurerm_resource_group.rg.name
#   app_plan_location = data.azurerm_resource_group.rg.location

#   app_plan_kind = var.app_plan_kind
#   app_plan_tier = var.app_plan_tier
#   app_plan_size = var.app_plan_size
# }

# module "demo_functionapp" {
#   source = "../../Modules/function_app_consumption"

#   functionapp_name     = var.functionapp_name
#   rg_name              = data.azurerm_resource_group.rg.name
#   functionapp_location = data.azurerm_resource_group.rg.location

#   functionapp_app_service_plan_id       = module.demo_app_service_plan.app_plan_id
#   functionapp_storage_connection_string = module.demo_blob_container.primary_connection_string

#   functionapp_runtime                         = var.worker_runtime
#   functionapp_appinsights_instrumentation_key = module.demo_appinsights.appinsights_instrumentation_key

#   func_virtual_network_name = module.demo_vnet.vnet_name

#   functionapp_tags = local.tags
# }

# module "web_app_service_plan" {
#   source = "../../Modules/app_service_plan_dedicated"

#   app_plan_name     = var.web_app_plan_name
#   rg_name           = data.azurerm_resource_group.rg.name
#   app_plan_location = data.azurerm_resource_group.rg.location

#   app_plan_tier = var.web_app_plan_tier
#   app_plan_size = var.web_app_plan_size
#   app_plan_kind = var.web_app_plan_kind
# }

# module "demo_web_app" {
#   source = "../../Modules/app_service_windows"

#   app_service_name     = var.app_service_name
#   rg_name              = data.azurerm_resource_group.rg.name
#   app_service_location = data.azurerm_resource_group.rg.location

#   app_service_plan_id      = module.web_app_service_plan.app_plan_id
#   dotnet_framework_version = var.dotnet_framework_version
#   app_virtual_network_name = module.demo_vnet.vnet_name

#   app_service_tags = local.tags
# }
