variable "resource_group_name"{
	description = "azure resource group name"
}
variable "location"{
	description = "azure resource location"
}
variable "nic_name" {
	description = "azure network interface name"
}
variable "ip_name" {
	description = "ipconfig name"
}
variable "subnet_id" {
	description = "subnet id"
}


variable "private_ip_address" {
	description = "private ip address to be assigned to the nic.keep it blank for dynamic ip assignment"
	default = ""
}
variable "private_ip_address_allocation" {
	description = "how a private ip address will be assigned to nic, valid values - Static,Dynamic"
}

variable "resource_tags" {
	type = map(string)
	description = "A map of the tags to use on the resources that are deployed with this module"
}


resource "azurerm_network_interface" "nic" {
	name 								= var.nic_name
	resource_group_name 				= var.resource_group_name
	location 							= var.location
	ip_configuration {
		name 							= var.ip_name
		subnet_id		 				= var.subnet_id
		private_ip_address_allocation 	= var.private_ip_address_allocation
		private_ip_address 				= var.private_ip_address_allocation == "Dynamic" ? var.private_ip_address_allocation :  var.private_ip_address
	}
	tags								=  var.resource_tags
}

output "id" {
	value = azurerm_network_interface.nic.id
}
output "mac_address" {
	value = azurerm_network_interface.nic.mac_address
}
output "private_ip_address" {
	value = azurerm_network_interface.nic.private_ip_address
}
