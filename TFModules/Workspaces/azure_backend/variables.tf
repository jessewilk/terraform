# Common
variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
}
variable "environment" {
  default = "demo"
}
variable "product_code" {
  description = "Used for naming resources"
  default     = "demo"
}
variable "geo_code" {
  description = "Code for Azure location. Used for naming resources."
  default     = "ussc"
}
variable "component_devops" {
  description = "Component name for the devops group. Used for naming resources."
  default     = "devops"
}


## Vnet Settings
variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/27"]
}

variable "subnet_name" {
}
variable "subnet_address_prefix" {
  default = "10.0.0.1/24"
}

variable "service_endpoints" {
  type        = list(string)
  description = "he list of Service endpoints to associate with the subnet. "
  default     = []
}

## KV settings
variable "devops_spn_name" {
  description = "Service Principal name to extract the object id"
  default     = "MySPNName"
}
variable "admin_objectid_list" {
  type        = list
  description = "User object id from Azure AD"
}
variable "keyvault_admin_key_permissions" {
  type    = list(string)
  default = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
}

variable "keyvault_admin_secret_permissions" {
  type    = list(string)
  default = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
}

variable "keyvault_admin_cert_permissions" {
  type    = list(string)
  default = ["backup", "create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "restore", "setissuers", "update"]
}

variable "keyvault_admin_storage_permissions" {
  description = "description"
  default     = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
}

## Storage Account
variable "container_name" {
  description = "The name of the Container which should be created within the Storage Account."
}
variable "container_access_type" {
  description = "The Access Level configured for this Container. Possible values are blob, container or private."
  default     = "private"
}

variable "storage_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
  default     = "Standard"
}
variable "storage_repl_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  default     = "LRS"
}
variable "storage_net_default_action" {
  description = "Specifies the default action of allow or deny when no other rules match."
  default     = "Deny"
}
variable "storage_net_bypass" {
  type        = list(string)
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. "
  default     = ["Metrics"]
}

## App Config
variable "app_config_sku" {
  default = "free"
}
