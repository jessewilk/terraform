variable "log_analytics_workspace_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
}

variable "log_analytics_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "log_analytics_workspace_sku" {
  description = "Name of the Sku of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, and PerGB2018"
  default     = "PerGB2018"
}

variable "log_analytics_tags" {
  type        = map(string)
  description = "description"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

