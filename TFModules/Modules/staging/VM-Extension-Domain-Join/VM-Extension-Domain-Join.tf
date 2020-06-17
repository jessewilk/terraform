variable "resource_group_name"{
	description = "azure resource group name"
}
variable "location"{
	description = "azure resource location"
}
variable "vm_name" {
	description = "azure virtual machine name"
}
variable "domain_name" {
	description = "name of windows active directory domain to join the vm"
}
variable "ou_name" {
	description = "name of active directory ou to place the vm.example,OU=ServerOU; DC=MyDomain; DC=com"
}
variable "domain_user_name" {
	description = "domain user name with rights to add a computer object to domain"
}
variable "domain_user_password" {
	description = "domain user password to add a computer object to domain"
}
variable "resourceTags" {
	type = map
	description = "A map of the tags to use on the resources that are deployed with this module"
}

locals {
	extension_name 					= "var.vm_name-addomainjoin"
	type 							= "JsonADDomainExtension"
	publisher 						= "Microsoft.Compute"
	handler_version 				= "1.3"
}

resource "azurerm_virtual_machine_extension" "domjoinextn" {
	name 							= "local.extension_name"
	location 						= "var.location"
	resource_group_name 			= "var.resource_group_name"
	virtual_machine_name			= "var.vm_name"
	publisher            			= "local.publisher"
	type							= "local.type"
	type_handler_version 			= "local.handler_version"
	auto_upgrade_minor_version		= true
	settings = <<SETTINGS
		{	
			"Name": "var.domain_name",
			"OUPath": "var.ou_name",
			"User": "var.domain_user_name",
			"Restart": "true",
			"Options": "3"
		}
		SETTINGS
	protected_settings = <<PROTECTED_SETTINGS
		{
			"Password": "var.domain_user_password"
		}
		PROTECTED_SETTINGS
	tags							= "var.resourceTags"
}

output "id" {
	value = "azurerm_virtual_machine_extension.domjoinextn.id"
}
