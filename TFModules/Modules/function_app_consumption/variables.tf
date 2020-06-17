variable "functionapp_name" {
  description = "Specifies the name of the resource to be deployed"
}
variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}
variable "functionapp_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "functionapp_app_service_plan_id" {
  description = "The ID of the App Service Plan within which to create this Function App."
}
variable "functionapp_storage_connection_string" {
  description = "The connection string of the backend storage account which will be used by this Function App (such as the dashboard, logs)."
}

variable "functionapp_appinsights_instrumentation_key" {
}
variable "functionapp_runtime" {
  description = "Worker runtime.  Dotnet, Python, etc."
  default     = "dotnet"
}

variable "func_always_on" {
  type        = bool
  description = "Should the Function App be loaded at all times?"
  default     = false
}
variable "func_ftps_state" {
  description = "State of FTP / FTPS service for this function app. "
  default     = "Disabled"
}
variable "use_32_bit_worker_process" {
  type        = bool
  description = "Should the Function App run in 32 bit mode, rather than 64 bit mode?"
  default     = true
}
variable "func_virtual_network_name" {
  description = "The name of the Virtual Network which this App Service should be attached to."
  default     = ""
}

variable "functionapp_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default     = {}
}
