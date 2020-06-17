resource "azurerm_sql_database" "module" {

  count = length(var.sql_db_list)
  name  = var.sql_db_list[count.index]

  location            = var.sql_db_location
  resource_group_name = var.rg_name

  server_name = var.sql_server_name

  tags = var.sql_db_tags
}
