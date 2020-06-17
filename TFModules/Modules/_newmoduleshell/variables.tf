variable "{{prefix}}_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "{{prefix}}_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "{{prefix}}_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}
