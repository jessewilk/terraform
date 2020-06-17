resource "azurerm_app_configuration" "module" {
  name                = var.app_config_name
  resource_group_name = var.rg_name
  location            = var.app_config_location

  sku  = var.app_config_sku
  tags = var.app_config_tags
}
