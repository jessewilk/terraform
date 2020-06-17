data "azurerm_key_vault" "appservices" {
  name                = var.demo_kv_name
  resource_group_name = var.rg_name
}
