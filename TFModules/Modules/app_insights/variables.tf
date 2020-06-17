variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}
variable "appinsights_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "appinsights_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "appinsights_app_type" {
  description = "Specifies the type of Application Insights to create"
  default     = "web"
}

variable "appinsights_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}
