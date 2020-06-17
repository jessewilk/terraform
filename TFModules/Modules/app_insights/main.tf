resource "azurerm_application_insights" "module" {
  name                = var.appinsights_name
  location            = var.appinsights_location
  resource_group_name = var.rg_name
  application_type    = var.appinsights_app_type

  tags = var.appinsights_tags
}