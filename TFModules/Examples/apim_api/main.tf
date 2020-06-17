module "demo_apim_api" {
  source = "git::https://dev.azure.com/BlueMetal/TenentHealthCare/_git/Azure_IaC//Modules/api_management_api"
  #source = "../../Modules/api_management_api"

  rg_name   = data.azurerm_resource_group.rg.name
  api_name  = var.api_name
  apim_name = data.azurerm_api_management.apim.name

  api_revision     = var.api_revision
  api_display_name = var.api_display_name
  api_path         = var.api_path

  content_format = var.content_format
  content_value  = var.content_value

  subscr_key_header = var.subscr_key_header
  subscr_key_query  = var.subscr_key_query
}
