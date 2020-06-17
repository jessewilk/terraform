variable "vnet_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "subnet_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "subnet_address_prefix" {
  description = "description"
  default     = "10.0.1.0/24"
}

variable "service_endpoints" {
  type        = list(string)
  description = "he list of Service endpoints to associate with the subnet. "
  default     = []
}

variable "subnet_tags" {
  type        = map(string)
  description = "description"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

