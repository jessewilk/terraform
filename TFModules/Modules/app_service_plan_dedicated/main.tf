resource "azurerm_app_service_plan" "module" {
  name                = var.app_plan_name
  resource_group_name = var.rg_name
  location            = var.app_plan_location

  kind = var.app_plan_kind

  sku {
    tier = var.app_plan_tier
    size = var.app_plan_size
  }
}