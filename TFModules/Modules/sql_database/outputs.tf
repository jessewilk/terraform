output "sql_db_name" {
  value = azurerm_sql_database.module[*].name
}
output "sql_db_id" {
  value = azurerm_sql_database.module[*].id
}
