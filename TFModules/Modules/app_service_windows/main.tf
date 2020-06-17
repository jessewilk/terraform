resource "azurerm_app_service" "module" {
  name                = var.app_service_name
  location            = var.app_service_location
  resource_group_name = var.rg_name

  app_service_plan_id = var.app_service_plan_id
  https_only          = true

  site_config {
    dotnet_framework_version  = var.dotnet_framework_version
    always_on                 = var.app_always_on
    ftps_state                = var.app_ftps_state
    use_32_bit_worker_process = var.use_32_bit_worker_process
    virtual_network_name      = var.app_virtual_network_name

    #   cors {
    #     count               = var.enable_cors ? 1 : 0
    #     allowed_origins     = var.cors_allowed_origins
    #     support_credentials = var.cors_support_credentials
    #   }

    #   ip_restriction {
    #     count                     = var.enable_ip_restrictions ? 1 : 0
    #     virtual_network_subnet_id = var.virtual_network_subnet_id
    #   }
  }

  tags = var.app_service_tags
  #   app_settings = {
  #     "SOME_KEY" = "some-value"
  #   }

  #   connection_string {
  #     name  = "Database"
  #     type  = "SQLServer"
  #     value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  #   }
}
