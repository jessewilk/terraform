variable "storage_name" {
  description = "Specifies the name of the storage account. "
}

variable "rg_name" {
  description = "description"
}

variable "storage_net_default_action" {
  description = "Specifies the default action of allow or deny when no other rules match."
  default     = "Deny"
}
variable "storage_net_ip_rules" {
  type        = list(string)
  description = "List of public IP or IP ranges in CIDR Format. "
  default     = []
}
variable "storage_net_subnet_ids" {
  type        = list(string)
  description = "A list of virtual network subnet ids to to secure the storage account."
  default     = []
}
variable "storage_net_bypass" {
  type        = list(string)
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. "
  default     = ["Metrics"]
}
