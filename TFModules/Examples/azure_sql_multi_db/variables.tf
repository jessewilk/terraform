variable "rg_name" {
  description = "Azure RG Name"
}

## SQL Server
variable "sql_server_name" {
  description = "description"
  default     = "demosql1132a"
}

variable "sql_admin_login" {
  description = "Login id of the SQL Server Admin"
  default     = "demoadmin"
}

variable "sql_server_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default     = {}
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
## SQLDB: Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web

variable "sql_db_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default     = {}
}
