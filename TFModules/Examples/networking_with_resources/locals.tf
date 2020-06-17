locals {
  tags = merge(data.azurerm_resource_group.rg.tags,
    map("Environment", var.environment),
    map("Location", data.azurerm_resource_group.rg.location)
  )
}
