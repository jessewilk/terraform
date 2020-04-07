variable "resource_group_name"{
	description = "azure resource group name"
}
variable "location"{
	description = "azure resource location"
}
variable "vnet_name" {
	description = "azure virtual network name"
}
variable "addr_space" {
	type = "list"
	description = "virtual network address space - CIDR Block , example, 10.0.0.0/16"
}
variable "dns_servers" {
	type = "list"
	description = "dns servers to be configured with the virtual network"
	default = []	
}
variable "resourceTags" {
	type = map
	description = "A map of the tags to use on the resources that are deployed with this module"
}


resource "azurerm_virtual_network" "vnet" {
	name 				= "var.vnet_name"
	resource_group_name = "var.resource_group_name"
	location 			= "var.location"
	address_space 		= "var.addr_space"
	dns_servers			= "var.dns_servers"
	tags				= "var.resourceTags"
}

output "id" {
	value = "azurerm_virtual_network.vnet.id"
}
output "name" {
	value = "azurerm_virtual_network.vnet.name"
}
