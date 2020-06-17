variable "resource_group_name" {
  description = "azure resource group name"
}
variable "location"{
    description = "resource location"
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
variable "resourceTags" {
	type = map
	default = {
        "TeamName" = "DEVOPS"
        "Department" = "TECHNOLOGY SERVICES"
	}
	description = "A map of the tags to use on the resources that are deployed with this module."
}

module "deploy_storageaccount" {
    source 						= "git::https://avidxchange.visualstudio.com/avidxchange/_git/avidxchange-terraform-modules//modules/New-Subnet"
    resource_group_name 		= "var.resource_group_name"
    location 					= "var.location"
    storage_account_name 		= "var.storage_account_name"
    account_kind 				= "var.account_kind"
    account_tier				= "var.account_tier"
	account_replication_type	= "var.account_replication_type"
	encryption_state			= "var.encryption_state"
	enable_https_traffic_only	= "var.enable_https_traffic_only"
	resourceTags 				= "var.resourceTags"
}
