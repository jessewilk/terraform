variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
}

variable "storage_name" {
  description = "The name of the Storage Account where the Container should be created."
}

variable "container_name" {
  description = "The name of the Container which should be created within the Storage Account."
}

variable "container_access_type" {
  description = "The Access Level configured for this Container. Possible values are blob, container or private."
  default     = "private"
}

variable "storage_location" {
  description = "Specifies the supported Azure location where the resource exists."
  default     = "eastus"
}

variable "storage_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
  default     = "Standard"
}

variable "storage_repl_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  default     = "LRS"
}

variable "storage_tags" {
  type        = map(string)
  description = "description"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

