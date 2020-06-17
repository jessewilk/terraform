# App Service Plan
# App Service

module "demo_app_service_plan" {
  source = "../../Modules/app_service_plan_dedicated"

  app_plan_name     = var.app_plan_name
  rg_name           = data.azurerm_resource_group.rg.name
  app_plan_location = data.azurerm_resource_group.rg.location

  app_plan_tier = var.app_plan_tier
  app_plan_size = var.app_plan_size
  app_plan_kind = var.app_plan_kind
}

module "demo_web_app" {
  source = "../../Modules/app_service_windows"

  app_service_name     = var.app_service_name
  rg_name              = data.azurerm_resource_group.rg.name
  app_service_location = data.azurerm_resource_group.rg.location

  app_service_plan_id      = module.demo_app_service_plan.app_plan_id
  dotnet_framework_version = var.dotnet_framework_version
  # enable_cors               = var.enable_cors
  # cors_allowed_origins      = var.cors_allowed_origins
  # cors_support_credentials  = var.cors_support_credentials
  # enable_ip_restrictions    = var.enable_ip_restrictions
  # virtual_network_subnet_id = var.virtual_network_subnet_id

  app_service_tags = var.all_tags
}

