variable "ddos_plan_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
}

variable "ddos_plan_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "ddos_plan_tags" {
  type        = map(string)
  description = "description"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

