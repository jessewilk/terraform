# Create two keyvaults in the same resource group

## Create vault using resource group's location
module "demo_apim" {
  source = "../../Modules/api_management"

  rg_name       = data.azurerm_resource_group.rg.name
  apim_name     = var.apim_name
  apim_location = data.azurerm_resource_group.rg.location

  apim_publisher_name  = var.apim_publisher_name
  apim_publisher_email = var.apim_publisher_email

  apim_sku_name = var.apim_sku_name

  apim_tags = var.all_tags
}

module "demo_appinsights" {
  source = "../../Modules/app_insights"

  rg_name              = data.azurerm_resource_group.rg.name
  appinsights_name     = var.appinsights_name
  appinsights_location = data.azurerm_resource_group.rg.location

  appinsights_tags = var.all_tags
}

module "demo_apim_logger" {
  source = "../../Modules/api_management_logger"

  rg_name      = data.azurerm_resource_group.rg.name
  apimlog_name = var.apimlog_name

  apimlog_apim_name               = module.demo_apim.apim_name
  appinsights_instrumentation_key = module.demo_appinsights.appinsights_instrumentation_key
}

