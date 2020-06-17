variable "app_config_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "app_config_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "app_config_sku" {
  description = "The SKU name of the the App Configuration. Possible values are free and standard."
  default     = "free"
}

variable "app_config_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}
