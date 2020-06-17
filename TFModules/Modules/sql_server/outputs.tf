output "sql_server" {
  description = "description"
  value = {
    sql_server_name = azurerm_sql_server.module.name
    sql_server_id   = azurerm_sql_server.module.id
    fqdn            = azurerm_sql_server.module.fully_qualified_domain_name

  }
}

output "sql_server_sensitive" {
  description = "description"
  value = {
    administrator_login          = azurerm_sql_server.module.administrator_login
    administrator_login_password = azurerm_sql_server.module.administrator_login_password
  }
  sensitive = true
}

# output "sql_server_name" {
#   value = azurerm_sql_server.module.name
# }
# output "sql_server_id" {
#   value = azurerm_sql_server.module.id
# }

# output "fully_qualified_domain_name" {
#   value = azurerm_sql_server.module.fully_qualified_domain_name
# }

# output "administrator_login" {
#   value     = azurerm_sql_server.module.administrator_login
#   sensitive = true
# }
# output "administrator_login_password" {
#   value     = azurerm_sql_server.module.administrator_login_password
#   sensitive = true
# }

