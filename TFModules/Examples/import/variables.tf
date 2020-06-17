variable "apim_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "apim_location" {
  description = "Specifies the supported Azure location where the resource exists."
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

variable "apim_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

