module "demo_app_config" {
  source              = "../../Modules/app_configuration"
  app_config_name     = var.app_config_name
  rg_name             = data.azurerm_resource_group.rg.name
  app_config_location = var.app_config_location

  app_config_sku  = var.app_config_sku
  app_config_tags = var.app_config_tags
}

