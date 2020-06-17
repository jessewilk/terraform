resource "azurerm_function_app" "module" {
  name                = var.functionapp_name
  resource_group_name = var.rg_name
  location            = var.functionapp_location

  app_service_plan_id       = var.functionapp_app_service_plan_id
  storage_connection_string = var.functionapp_storage_connection_string

  https_only = true
  version    = "~2"

  site_config {
    always_on                 = var.func_always_on
    ftps_state                = var.func_ftps_state
    use_32_bit_worker_process = var.use_32_bit_worker_process
    virtual_network_name      = var.func_virtual_network_name
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME       = var.functionapp_runtime
    APPINSIGHTS_INSTRUMENTATIONKEY = var.functionapp_appinsights_instrumentation_key
  }

  tags = var.functionapp_tags
}
