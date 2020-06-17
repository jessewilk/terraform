variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "apimlog_name" {
  description = "Specifies the name of the resource to be deployed"
}

variable "apimlog_apim_name" {
  description = "The name of the API Management Service. Changing this forces a new resource to be created."
}

variable "appinsights_instrumentation_key" {
  description = "The instrumentation key used to push data to Application Insights."
}
