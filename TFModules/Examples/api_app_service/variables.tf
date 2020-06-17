variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
  default     = "My-RG"
}

variable "app_plan_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "app_plan_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "app_plan_tier" {
  description = "Specifies the plan's pricing tier."
  default     = "Basic"
}

variable "app_plan_size" {
  description = "Specifies the plan's instance size."
  default     = "B1"
}
variable "app_plan_kind" {
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan)."
  default     = "Windows"
}

variable "all_tags" {
  type        = map(string)
  description = "description"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

variable "app_service_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "app_service_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "dotnet_framework_version" {
  default = "v4.0"
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
#   default     = ""
# }
