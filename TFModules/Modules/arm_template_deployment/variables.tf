variable "deployment_name" {
  description = "description"
  default     = "default12345"
}
variable "arm_template_file_path" {
  description = "File name and path of the ARM template"
}

variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "arm_parameters" {
  type    = map(string)
  default = {}
}
