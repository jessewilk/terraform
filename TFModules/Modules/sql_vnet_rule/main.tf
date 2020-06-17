resource "azurerm_sql_virtual_network_rule" "module" {
  name                = var.sql_vnet_rule_name
  resource_group_name = var.rg_name
  server_name         = var.sql_server_name
  subnet_id           = var.subnet_id
}
