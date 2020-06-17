variable "rg_name" {
  description = "Specifies the Resource Group where the resource should exist"
}

variable "keyvault_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "keyvault_name" {
  description = "Name of the vault. [Required]"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant id. [Required]"
}

variable "keyvault_sku" {
  description = "Sku for the vault"
  default     = "standard"
}

variable "keyvault_enabled_for_deployment" {
  type        = bool
  description = "Boolean value to enable the vault for deployments."
  default     = true
}

variable "keyvault_enabled_for_template_deployment" {
  type        = bool
  description = "Boolean value to enable the vault for ARM Template deployments."
  default     = true
}

variable "keyvault_enabled_for_disk_encryption" {
  type        = bool
  description = "Boolean value to enable the vault for disk encryption."
  default     = true
}

# variable "object_id" {
#   type        = string
#   description = "Object Id for the access policy. [Required]"
# }
# variable "user_objectid_list" {
#   type = list(string)
#   description = "List of user object ids."
# }

# variable "keyvault_key_permissions" {
#   type        = list(string)
#   description = "List of Key permissions for the vault."
#   default     = ["Get"]
# }

# variable "keyvault_secret_permissions" {
#   type        = list(string)
#   description = "List of Secret permissions for the vault."
#   default     = ["Get"]
# }

# variable "keyvault_cert_permissions" {
#   type        = list(string)
#   description = "List of Certificate permissions for the vault."
#   default     = ["Get"]
# }

# variable "keyvault_storage_permissions" {
#   type        = list(string)
#   description = "List of Storage permissions for the vault."
#   default     = ["Get"]
# }

variable "keyvault_network_acls" {
  type        = map(string)
  description = "Set of Network ACL settings for the vault."
  default = {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
}

variable "network_action" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
  default     = "Allow"
}

variable "keyvault_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default     = {}
}

variable "access_policies" {
  type = list(object({
    tenant_id               = string
    object_id               = string
    application_id          = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
    storage_permissions     = list(string)
  }))
  description = "List of access policy blocks"
  default = [
    {
      tenant_id               = ""
      object_id               = ""
      application_id          = null
      key_permissions         = []
      secret_permissions      = []
      certificate_permissions = []
      storage_permissions     = []
    }
  ]
}
