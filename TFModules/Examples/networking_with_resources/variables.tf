variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
}
variable "environment" {
  description = "description"
  default     = "sbx"
}

## Vnet Settings
variable "vnet_name" {
  default = "myvnets88822"
}

variable "vnet_location" {
  default = "default"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/27"]
}

variable "subnet1_name" {
}
variable "subnet2_name" {
}
variable "subnet1_address_prefix" {
  default = "10.0.0.1/24"
}
variable "subnet2_address_prefix" {
  default = "10.0.0.2/24"
}

variable "service_endpoints" {
  type        = list(string)
  description = "he list of Service endpoints to associate with the subnet. "
  default     = []
}

variable "vnet_tags" {
  type        = map(string)
  description = "description"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

## KV settings
variable "devops_spn_name" {
  description = "Service Principal name to extract the object id"
  default     = "MySPNName"
}
variable "demo_kv_name" {
  type    = string
  default = "demovault88583"
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

## SQL Settings
variable "sql_vnet_rule_name" {
  default = "default"
}

variable "sql_server_name" {
  description = "description"
}

variable "sql_admin_login" {
  description = "Login id of the SQL Server Admin"
}

variable "sql_server_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default     = {}
}

variable "sql_password_name" {
  description = "Name of the Keyvault secret"
  default     = "SQLAdminPassword"
}

## SQL Database
variable "sql_db_list" {
  type        = list(string)
  description = "List of database names."
}

variable "sql_db_edition" {
  description = "The edition of the database to be created."
  default     = "Standard"
}
##  Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web

variable "sql_db_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default     = {}
}

## Storage Account
variable "storageacct_name" {
}

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

## Func app
variable "appinsights_name" {
  description = "Specifies the name of the resource to be deployed"
}
variable "storage_name" {
  description = "Specifies the name of the storage account."
}
variable "app_plan_name" {
  description = "Specifies the name of the resource to be deployed"
}
variable "functionapp_name" {
  description = "Specifies the name of the resource to be deployed"
}
variable "functionapp_name2" {
  description = "Specifies the name of the resource to be deployed"
}
# variable "container_name" {
#   description = "The name of the Container which should be created within the Storage Account."
# }
# variable "container_access_type" {
#   description = "The Access Level configured for this Container. Possible values are blob, container or private."
#   default     = "private"
# }
# variable "storage_tier" {
#   description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
#   default     = "Standard"
# }
# variable "storage_repl_type" {
#   description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
#   default     = "LRS"
# }

variable "app_plan_kind" {
  default = "FunctionApp"
}

# Web app settings
variable "app_plan_tier" {
  description = "Specifies the plan's pricing tier."
}
variable "app_plan_size" {
  description = "Specifies the plan's instance size."
}

variable "worker_runtime" {
  default = "dotnet"
}
variable "web_app_plan_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "web_app_plan_tier" {
  description = "Specifies the plan's pricing tier."
  default     = "Basic"
}

variable "web_app_plan_size" {
  description = "Specifies the plan's instance size."
  default     = "B1"
}
variable "web_app_plan_kind" {
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan)."
  default     = "Windows"
}
variable "app_service_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "dotnet_framework_version" {
  default = "v4.0"
}
