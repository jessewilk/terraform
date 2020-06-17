variable "apim_name" {
  description = "description"
  default     = "myapim88822"
}

variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
  default     = "My-RG"
}

variable "apim_location" {
  description = "description"
  default     = "eastus"
}

variable "apim_publisher_name" {
  description = "The name of publisher/company."
  default     = "MyCo"
}

variable "apim_publisher_email" {
  description = "The email of publisher/company."
  default     = "email@yourco.com"
}

variable "apim_sku_name" {
  description = "sku_name is a string consisting of two parts separated by an underscore(_). The fist part is the name, valid values include: Developer, Basic, Standard and Premium. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
  default     = "Developer_1"
}

variable "all_tags" {
  type        = map(string)
  description = "description"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
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

variable "apimlog_name" {
  description = "Specifies the name of the resource to be deployed"
}

