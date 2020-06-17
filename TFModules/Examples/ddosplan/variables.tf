variable "ddos_plan_name" {
  description = "description"
  default     = "myddos88822"
}

variable "ddos_location" {
  description = "description"
}

variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
}

variable "ddos_tags" {
  type        = map(string)
  description = "description"
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

