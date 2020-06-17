variable "app_config_name" {
  description = "description"
  default     = "myddos88822"
}

variable "app_config_location" {
  description = "description"
}

variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
}

variable "app_config_sku" {
  default = "free"
}

variable "app_config_tags" {
  type        = map(string)
  description = "description"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

