resource "azurerm_api_management_api" "module" {
  name                = var.api_name
  resource_group_name = var.rg_name
  api_management_name = var.apim_name
  revision            = var.api_revision
  display_name        = var.api_display_name
  path                = var.api_path
  protocols           = ["https"] #Leave at https only.

  import {
    content_format = var.content_format
    content_value  = var.content_value
  }

  subscription_key_parameter_names {
    header = var.subscr_key_header
    query  = var.subscr_key_query
  }
}
