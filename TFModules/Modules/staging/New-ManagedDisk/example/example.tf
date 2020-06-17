variable "resource_group_name" {
  description = "azure resource group name"
}
variable "location"{
    description = "resource location"
}
variable "disk_name" {
	description = "azure managed disk name"
}
variable "storage_account_type" {
	description = "type of storage account to use for the managed disk.valid values - Premium_LRS, Standard_LRS"
	default = "Standard_LRS"
}
variable "disk_size_gb" {
	description = "azure managed disk size in GB"
	default = "500"
}
variable "resourceTags" {
	type = map
	default = {
        "TeamName" = "DEVOPS"
        "Department" = "TECHNOLOGY SERVICES"
	}
	description = "A map of the tags to use on the resources that are deployed with this module"
}

module "deploy_disk" {
    source 							= "git::https://avidxchange.visualstudio.com/avidxchange/_git/avidxchange-terraform-modules//modules/New-ManagedDisk"
    resource_group_name 			= "var.resource_group_name"
	location 						= "var.location"
	disk_name 						= "var.disk_name"
    storage_account_type 			= "var.storage_account_type"
	disk_size_gb 					= "var.disk_size_gb"
	resourceTags 					= "var.resourceTags"
}
