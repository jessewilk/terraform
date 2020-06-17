resource "azurerm_sql_server" "module" {
  name                = var.sql_server_name
  location            = var.sql_server_location
  resource_group_name = var.rg_name

  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = random_password.password.result

  tags = var.sql_server_tags
}

resource "random_password" "password" {
  length  = 16
  special = true
}
