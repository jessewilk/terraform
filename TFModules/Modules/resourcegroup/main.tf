resource "azurerm_resource_group" "module" {
  name     = var.rg_name
  location = var.location

  tags = var.rg_tags
}

