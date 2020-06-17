variable "analysis_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "analysis_location" {
  description = "Specifies the supported Azure location where the resource exists."
}

variable "analysis_sku" {
  description = "SKU for the Analysis Services Server. Possible values are: D1, B1, B2, S0, S1, S2, S4, S8 and S9"
  default     = "S0"
}

variable "analysis_sas_uri" {
  description = " URI and SAS token for a blob container to store backups."
}

variable "analysis_firewall_rule" {
  description = "Specifies the name of the firewall rule."
  default     = "MyRule1"
}

variable "analysis_fw_range_start" {
  description = "Start of the firewall rule range as IPv4 address."
  default     = "default"
}

variable "analysis_fw_range_end" {
  description = "End of the firewall rule range as IPv4 address."
  default     = "default"
}

variable "analysis_admins" {
  type        = list(string)
  description = ""
  default     = ["email@someco.com", "email2@someco.com"]
}

variable "analysis_tags" {
  type        = map(string)
  description = "Tags, if any, to apply to the resource."
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}

