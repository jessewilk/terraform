variable "keyvault_secret_name" {
  description = "Specifies the name of the Key Vault Secret. "
}

variable "keyvault_secret_value" {
  description = "Specifies the value of the Key Vault Secret."
}

variable "keyvault_id" {
  description = "Name of the vault. [Required]"
}

variable "keyvault_secret_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the secret."
  default     = {}
}

