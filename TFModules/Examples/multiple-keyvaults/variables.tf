variable "devops_spn_name" {
  description = "Service Principal name to extract the object id"
  default     = "MySPNName"
}

variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
  default     = "TerraDemo-RG"
}

variable "rg_location" {
  default = "southcentralus"
}

variable "demo_kv_name" {
  type    = string
  default = "demovault88583"
}

variable "myapp_kv_name" {
  type    = string
  default = "myappvault12345"
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

variable "keyvault_tags" {
  type        = map(string)
  description = "Tags to apply to the vault"
  default = {
    tagname1 = "default"
    tag2     = "mytag"
  }
}

