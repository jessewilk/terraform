variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}
variable "sql_server_name" {
  description = "Specifies the name of the resource to be deployed"
}
variable "sql_server_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "sql_admin_login" {
  description = "Login id of the SQL Server Admin"
  default     = "ereserveadmin"
}

variable "sql_server_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default     = {}
}
