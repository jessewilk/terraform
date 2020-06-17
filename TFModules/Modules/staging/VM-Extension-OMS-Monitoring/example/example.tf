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
	default = {
        "TeamName" = "DEVOPS"
        "Department" = "TECHNOLOGY SERVICES"
	}
	description = "A map of the tags to use on the resources that are deployed with this module"
}

module "deploy_omsmonitorextn" {
    source 						= "git::https://avidxchange.visualstudio.com/avidxchange/_git/avidxchange-terraform-modules//modules/VM-Extension-OMS-Monitoring"
    resource_group_name 		= "var.resource_group_name"
	location 					= "var.location"
	vm_name			 			= "var.vm_name"
	workspace_name				= "var.workspace_name"
	workspace_resource_group	= "var.workspace_resource_group"
	resourceTags 				= "var.resourceTags"
}
