variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "sql_db_list" {
  type        = list(string)
  description = "List of database names."
}

variable "sql_server_name" {
  description = "Specifies the name of the resource to be deployed"
}
variable "sql_db_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "sql_db_edition" {
  description = "The edition of the database to be created."
  default     = "Standard"
}
##  Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web

variable "sql_db_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default     = {}
}
