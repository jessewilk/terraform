variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
  default     = "aas_x_001"
}

variable "admin_objectid_list" {
  type        = list(string)
  description = "List of Admin user email addresses."
  default     = ["ea46184f-b0b5-497d-9759-0717474e04ec", "e768f885-9a36-4a67-89eb-4db716d062d3", "759d470d-c5f8-42d5-9ce1-272b1072684c"]
}
// variable "admin_email_list" {
//   type = list(string)
//   description = "List of Admin user email addresses."
//   default = ["andrew.stephens@insight.com", "tony.landi@insight.com"]
// }

variable "keyvault_name" {
  type    = string
  default = "aas001kv1609"
}

variable "keyvault_admin_key_permissions" {
  type    = list(string)
  default = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
}

variable "keyvault_admin_secret_permissions" {
  type    = list(string)
  default = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
}

variable "keyvault_admin_cert_permissions" {
  type    = list(string)
  default = ["backup", "create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "restore", "setissuers", "update"]
}

variable "keyvault_admin_storage_permissions" {
  description = "description"
  default     = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
}
