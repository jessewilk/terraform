variable "resource_group_name"{
	description = "azure resource group name"
}
variable "location"{
	description = "azure resource location"
}
variable "vm_name" {
	description = "azure virtual machine name"
}
variable "workspace_name" {
	description = "name of azure log analytics workspace"
}
variable "workspace_resource_group" {
	description = "name of resource group hosting azure log analytics workspace"
}
variable "resourceTags" {
	type = map
	description = "A map of the tags to use on the resources that are deployed with this module"
}

locals {
	extension_name 					= "var.vm_name-omsmonitoring"
	type 							= "MicrosoftMonitoringAgent"
	publisher 						= "Microsoft.EnterpriseCloud.Monitoring"
	handler_version 				= "1.0"
	workspace_id 					= "data.azurerm_log_analytics_workspace.workspace.workspace_id"
	workspace_key 					= "data.azurerm_log_analytics_workspace.workspace.primary_shared_key"
}

data "azurerm_log_analytics_workspace" "workspace" {
  	name               				= "var.workspace_name"
  	resource_group_name 			= "var.workspace_resource_group"
}

resource "azurerm_virtual_machine_extension" "omsmonitoring" {
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
			"workspaceId": "local.workspace_id"
		}
		SETTINGS
	protected_settings = <<PROTECTED_SETTINGS
		{
			"workspaceKey": "local.workspace_key"
		}
		PROTECTED_SETTINGS
	tags							= "var.resourceTags"
}

output "id" {
	value = "azurerm_virtual_machine_extension.omsmonitoring.id"
}
