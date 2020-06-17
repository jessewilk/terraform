resource "azurerm_network_security_group" "module" {
  name                = var.nsg_name
  location            = var.nsg_location
  resource_group_name = var.rg_name

  tags = var.nsg_tags
}

