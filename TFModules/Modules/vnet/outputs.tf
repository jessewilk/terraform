output "vnet_name" {
  value = azurerm_virtual_network.module.name
}

output "vnet_id" {
  value = azurerm_virtual_network.module.id
}

output "vnet_address_space" {
  value = azurerm_virtual_network.module.address_space
}
