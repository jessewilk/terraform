variable "keyvault_id" {
  description = "Name of the vault. [Required]"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant id. [Required]"
}

variable "user_objectid_list" {
  type        = list(string)
  description = "List of user object ids."
}

// variable "user_email_list" {
//   type = list(string)
//   description = "List of Admin user email addresses."
// }

variable "keyvault_key_permissions" {
  type        = list(string)
  description = "List of Key permissions for the vault."
  default     = ["Get"]
}

variable "keyvault_secret_permissions" {
  type        = list(string)
  description = "List of Secret permissions for the vault."
  default     = ["Get"]
}

variable "keyvault_cert_permissions" {
  type        = list(string)
  description = "List of Certificate permissions for the vault."
  default     = ["Get"]
}

variable "keyvault_storage_permissions" {
  type        = list(string)
  description = "List of Storage permissions for the vault."
  default     = ["Get"]
}
