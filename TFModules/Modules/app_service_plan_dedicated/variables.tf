variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
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
