variable "vnet_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "vnet_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "vnet_address_space" {
  description = "The address space that is used the virtual network."
  default     = "default"
}

variable "vnet_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

