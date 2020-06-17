variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
}

variable "vnet_name" {
  default = "myvnets88822"
}

variable "vnet_location" {
  default = "default"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/27"]
}

variable "subnet1_name" {
}
variable "subnet2_name" {
}
variable "subnet1_address_prefix" {
  default = "10.0.0.1/24"
}
variable "subnet2_address_prefix" {
  default = "10.0.0.2/24"
}
variable "service_endpoints" {
  type        = list(string)
  description = "he list of Service endpoints to associate with the subnet. "
  default     = []
}

variable "vnet_tags" {
  type        = map(string)
  description = "description"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

