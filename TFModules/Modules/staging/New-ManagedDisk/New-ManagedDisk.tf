variable "resource_group_name"{
	description = "azure resource group name"
}
variable "location"{
	description = "azure resource location"
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
variable "create_option" {
	description = "create options for azure managed disk.valid values - Import,Empty,Copy,FromImage"
	default = "Empty"
}
variable "source_uri" {
	description = "uri to a valid vhd file to be used when create option is Import"
	default = ""
}
variable "source_resource_id" {
	description = "id of an existing managed disk to copy when create option is Copy"
	default = ""
}
variable "image_reference_id" {
	description = "id of an existing platform/marketplace disk image to copy when create option is FromImage"
	default = ""
}
variable "resourceTags" {
	type = map
	description = "A map of the tags to use on the resources that are deployed with this module"
}

locals {
		source_uri = "lower(var.create_option) == "import" ? var.disk_source_uri :  "" "
		source_resource_id = "lower(var.create_option) == "copy" ? var.source_resource_id :  "" "
		image_reference_id = "lower(var.create_option) == "fromimage" ? var.image_reference_id :  "" "
}

resource "azurerm_managed_disk" "disk" {
	name 								= "var.disk_name"
	resource_group_name 				= "var.resource_group_name"
	location 							= "var.location"
	storage_account_type				= "var.storage_account_type"
	disk_size_gb						= "var.disk_size_gb"
	create_option						= "var.create_option"
	source_uri							= "local.source_uri"
	source_resource_id					= "local.source_resource_id"
	image_reference_id					= "local.image_reference_id"
	tags								= "var.resourceTags"
}

output "id" {
	value = "azurerm_managed_disk.disk.id"
}
