## Storage Account
## App Srvice Plan
## Function App

module "demo_appinsights" {
  source = "../../Modules/app_insights"

  rg_name              = data.azurerm_resource_group.rg.name
  appinsights_name     = var.appinsights_name
  appinsights_location = data.azurerm_resource_group.rg.location

  appinsights_tags = var.all_tags
}

module "demo_storageacct" {
  source = "../../Modules/storage_container"

  storage_name     = var.storage_name
  rg_name          = data.azurerm_resource_group.rg.name
  storage_location = data.azurerm_resource_group.rg.location

  storage_tier          = var.storage_tier
  storage_repl_type     = var.storage_repl_type
  container_name        = var.container_name
  container_access_type = var.container_access_type

  storage_tags = var.all_tags
}

module "demo_app_service_plan" {
  source = "../../Modules/app_service_plan_dedicated"

  app_plan_name     = var.app_plan_name
  rg_name           = data.azurerm_resource_group.rg.name
  app_plan_location = data.azurerm_resource_group.rg.location

  app_plan_kind = var.app_plan_kind
  app_plan_tier = var.app_plan_tier
  app_plan_size = var.app_plan_size
}

module "demo_functionapp" {
  source = "../../Modules/function_app_consumption"

  functionapp_name     = var.functionapp_name
  rg_name              = data.azurerm_resource_group.rg.name
  functionapp_location = data.azurerm_resource_group.rg.location

  functionapp_app_service_plan_id       = module.demo_app_service_plan.app_plan_id
  functionapp_storage_connection_string = module.demo_storageacct.primary_connection_string

  functionapp_runtime                         = var.worker_runtime
  functionapp_appinsights_instrumentation_key = module.demo_appinsights.appinsights_instrumentation_key

  functionapp_tags = var.all_tags
}

# module "demo_functionapp2" {
#   source = "../../Modules/function_app_consumption"

#   functionapp_name     = var.functionapp_name2
#   rg_name              = data.azurerm_resource_group.rg.name
#   functionapp_location = data.azurerm_resource_group.rg.location

#   functionapp_app_service_plan_id       = module.demo_app_service_plan.app_plan_id
#   functionapp_storage_connection_string = module.demo_storageacct.primary_connection_string

#   functionapp_runtime                         = var.worker_runtime
#   functionapp_appinsights_instrumentation_key = module.demo_appinsights.appinsights_instrumentation_key

#   functionapp_tags = var.all_tags
# }
