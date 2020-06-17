resource "azurerm_api_management_logger" "module" {
  name                = var.apimlog_name
  resource_group_name = var.rg_name

  api_management_name = var.apimlog_apim_name

  application_insights {
    instrumentation_key = var.appinsights_instrumentation_key
  }
}
