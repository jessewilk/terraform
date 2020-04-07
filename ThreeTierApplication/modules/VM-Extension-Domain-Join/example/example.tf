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
	description = "name of active directory ou to place the vm"
}
variable "domain_user_name" {
	description = "domain user name with rights to add a computer object to domain"
}
variable "domain_user_password" {
	description = "domain user password to add a computer object to domain"
}
variable "resourceTags" {
	type = map
	default = {
        "TeamName" = "DEVOPS"
        "Department" = "TECHNOLOGY SERVICES"
	}
	description = "A map of the tags to use on the resources that are deployed with this module"
}

module "deploy_domjoinextn" {
    source 					= "git::https://avidxchange.visualstudio.com/avidxchange/_git/avidxchange-terraform-modules//modules/VM_Extension_Domain_Join"
    resource_group_name 	= "var.resource_group_name"
	location 				= "var.location"
	vm_name			 		= "var.vm_name"
	domain_name			 	= "var.domain_name"
	ou_name			 		= "var.ou_name"
	domain_user_name		= "var.domain_user_name"
	domain_user_password	= "var.domain_user_password"
	resourceTags 			= "var.resourceTags"
}
