resource "azurerm_subnet" "module" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name

  address_prefix = var.subnet_address_prefix

  service_endpoints = var.service_endpoints
}

