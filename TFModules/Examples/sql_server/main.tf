## SQL Admin password is generated within the module.
module "demo_sql_server" {
  source = "../../Modules/sql_server"

  sql_server_name     = var.sql_server_name
  rg_name             = data.azurerm_resource_group.rg.name
  sql_server_location = data.azurerm_resource_group.rg.location

  sql_admin_login = var.sql_admin_login

  sql_server_tags = local.tags
}

module "demo_sql_server_dbs" {
  source = "../../Modules/sql_database"

  sql_server_name = module.demo_sql_server.sql_server_name
  rg_name         = data.azurerm_resource_group.rg.name
  sql_db_location = data.azurerm_resource_group.rg.location

  sql_db_list = var.sql_db_list

  sql_db_tags = var.sql_db_tags
}
