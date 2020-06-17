variable "api_name" {
  description = "The name of the API Management API."
}

variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}

variable "apim_name" {
  description = "The Name of the API Management Service where this API should be created."
}

variable "api_revision" {
  description = "The Revision which used for this API."
}

variable "api_display_name" {
  description = "The display name of the API."
}

variable "api_path" {
  description = "The Path for this API Management API, which is a relative URL which uniquely identifies this API and all of it's resource paths within the API Management Service."
}
variable "content_format" {
  description = "The format of the content from which the API Definition should be imported."
  default     = "swagger-link-json"
}
variable "content_value" {
  description = "The Content from which the API Definition should be imported. When a content_format of *-link-* is specified this must be a URL, otherwise this must be defined inline."
  default     = "http://conferenceapi.azurewebsites.net/?format=json"
}

variable "subscr_key_header" {
  description = "The name of the HTTP Header which should be used for the Subscription Key."
  default     = "Ocp-Apim-Subscription-Key"
}

variable "subscr_key_query" {
  description = "The name of the QueryString parameter which should be used for the Subscription Key."
  default     = "subscription-key"
}
