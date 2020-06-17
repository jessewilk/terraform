variable "sql_vnet_rule_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "sql_server_name" {
  description = "The name of the SQL Server to which this SQL virtual network rule will be applied to. "
}

variable "subnet_id" {
  description = "The ID of the subnet that the SQL server will be connected to."
}
