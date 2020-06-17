variable "resource_group_name" {
  description = "Enter name for Azure Resource group"
}
variable "subnet_name" {
  description = "Enter Azure Subnet Name"
}
variable "vnet_name" {
  description = "Enter Azure Virtual network Name"
}
variable "addr_prefix" {
  description = "Enter Subnet Address Prefix - CIDR Block, example - 10.0.0.0/24"
}

resource "azurerm_subnet" "subnet" {
  name                      = "var.subnet_name"
  resource_group_name       = "var.resource_group_name"
  virtual_network_name      = "var.vnet_name"
  address_prefix            = "var.addr_prefix"
}

output "id" {
  value = "azurerm_subnet.subnet.id"
}
output "name" {
  value = "azurerm_subnet.subnet.name"
}
output "address_prefix" {
  value = "azurerm_subnet.subnet.address_prefix"
}

