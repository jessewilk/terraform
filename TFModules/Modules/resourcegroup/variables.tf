variable "rg_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Location for the group"
}

variable "rg_tags" {
  type        = map(string)
  description = "Tags for the resource group"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}
