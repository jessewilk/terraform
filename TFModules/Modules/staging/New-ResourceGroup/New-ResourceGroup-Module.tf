variable "resource_group_name"{
	description = "Enter name for Azure Resource group"
}
variable "location"{
	description = "Enter Resource group location"
}
variable "resource_tags" {
	  type = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
resource "azurerm_resource_group" "rg" {
	name = var.resource_group_name
	location = var.location
	tags = var.resource_tags
}

output "id"{
	value = azurerm_resource_group.rg.id
}
output "name"{
	value = azurerm_resource_group.rg.name
}
output "location"{
	value = azurerm_resource_group.rg.location
}
