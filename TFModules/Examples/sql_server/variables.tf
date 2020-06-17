variable "rg_name" {
  description = "description"
  default     = "default"
}
variable "environment" {
  description = "description"
  default     = "sbx"
}

## SQL Server
variable "sql_server_name" {
  description = "description"
}

variable "sql_admin_login" {
  description = "Login id of the SQL Server Admin"
}

variable "sql_server_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default     = {}
}

variable "sql_password_name" {
  description = "Name of the Keyvault secret"
  default     = "SQLAdminPassword"
}

## SQL Database
variable "sql_db_list" {
  type        = list(string)
  description = "List of database names."
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
