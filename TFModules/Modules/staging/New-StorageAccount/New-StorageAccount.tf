variable "resource_group_name" {
	description = "Enter name for Azure Resource group"
}
variable "location" {
	description = "Enter Resource group location"
}
variable "storage_account_name" {
	description = "Enter name for storage account.All in lowercase.No Special characters."
}
variable "account_kind" {
	description = "kind of storage account.valid values - Storage, StorageV2, BlobStorage"
	default = "StorageV2"
}
variable "account_tier"{
	description = "tier to use for storage acount.Valid values - Standard,Premium"
	default = "Standard"
}
variable "access_tier"{
	description = "access tier to use for storage acount.Valid values - Hot,Cool"
	default = "Hot"
}
variable "account_replication_type" {
	description = "type of replication for storage account.valid values - LRS, GRS, RAGRS, ZRS"
	default = "LRS"
}
variable "encryption_state" {
	description = "boolean true or false.this sets the storage account file and blob encryption state"
	default = "true"
}
variable "enable_https_traffic_only" {
	description = "boolean true or false.enables or disables account raffic encryption"
	default = "true"
}
variable "resourceTags"{
	type = map
	description = "A map of the tags to use on the resources that are deployed with this module."
}

locals {
	account_encryption_source 	= "Microsoft.Storage"
	identity_type 				= "SystemAssigned"
	sa_name 					= "lower(substr(var.vmname_prefix, 0, min(24, length(var.vmname_prefix))))"
}

resource "azurerm_storage_account" "sa" {
	name 						= "local.sa_name"
	resource_group_name 		= "var.resource_group_name"
    location 					= "var.location"
	account_kind 				= "var.account_kind"
	account_tier				= "var.account_tier"
	access_tier 				= "var.access_tier"
	account_replication_type 	= "var.account_replication_type"
	enable_blob_encryption 		= "var.encryption_state"
	enable_file_encryption 		= "var.encryption_state"
	enable_https_traffic_only 	= "var.enable_https_traffic_only"
	account_encryption_source 	= "local.account_encryption_source"
	identity {
		type = "local.identity_type"
	}
	tags 						= "var.resourceTags"
}

output "id"{
	value = "azurerm_storage_account.sa.id"
}
output "primary_access_key"{
	value = "azurerm_storage_account.sa.primary_access_key"
}
output "primary_connection_string"{
	value = "azurerm_storage_account.sa.primary_connection_string"
}
