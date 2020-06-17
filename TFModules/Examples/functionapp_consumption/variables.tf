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

variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
  default     = "My-RG"
}

# variable "apim_location" {
#   description = "description"
#   default     = "eastus"
# }

variable "all_tags" {
  type        = map(string)
  description = "description"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
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

variable "app_plan_kind" {
  default = "FunctionApp"
}

variable "app_plan_tier" {
  description = "Specifies the plan's pricing tier."
}
variable "app_plan_size" {
  description = "Specifies the plan's instance size."
}

variable "worker_runtime" {
  default = "dotnet"
}