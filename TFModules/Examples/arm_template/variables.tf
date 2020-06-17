variable "rg_name" {
  description = "description"
  default     = "default"
}

variable "deployment_name" {
  description = "description"
  default     = "default12345"
}
variable "arm_template_file_name" {
  description = "File name of the ARM template"
  default     = "storage_acct_example.json"
}

variable "arm_parameters" {
  type    = map(string)
  default = {}
}

variable "storage_name" {
}
