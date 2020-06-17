locals {
  tags = merge(data.azurerm_resource_group.rg.tags,
    map("Environment", var.environment),
    map("Resource Name", var.sql_server_name),
    map("Location", data.azurerm_resource_group.rg.location)
  )
}
