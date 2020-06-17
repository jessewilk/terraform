variable "app_service_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "app_service_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan within which to create this App Service."
}
variable "dotnet_framework_version" {
  description = "The version of the .net framework's CLR used in this App Service."
  default     = "v4.0"
}

variable "app_always_on" {
  type        = bool
  description = "Should the Function App be loaded at all times?"
  default     = false
}
variable "app_ftps_state" {
  description = "State of FTP / FTPS service for this function app. "
  default     = "Disabled"
}
variable "use_32_bit_worker_process" {
  type        = bool
  description = "Should the Function App run in 32 bit mode, rather than 64 bit mode?"
  default     = true
}
variable "app_virtual_network_name" {
  description = "The name of the Virtual Network which this App Service should be attached to."
  default     = ""
}

# variable "enable_cors" {
#   description = "Is CORS enabled?"
#   type        = bool
#   default     = false
# }

# variable "cors_allowed_origins" {
#   description = "A list of origins which should be able to make cross-origin calls. * can be used to allow all calls."
#   default     = "*"
# }
# variable "cors_support_credentials" {
#   description = "Are credentials supported?"
#   type        = bool
# }

# variable "enable_ip_restrictions" {
#   description = "Are IP restrictions enabled?"
#   type        = bool
#   default     = false
# }
# variable "virtual_network_subnet_id" {
#   description = "The Virtual Network Subnet ID used for this IP Restriction."
# }

variable "app_service_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default     = {}
}
