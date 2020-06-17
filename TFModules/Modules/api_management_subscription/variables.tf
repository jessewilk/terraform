variable "rg_name" {
  description = "The name of the resource group in which the resource is created"
}
variable "apim_name" {
  description = "he name of the API Management Service where this Subscription should be created."
}

variable "subscription_display_name" {
  description = "The display name of this Subscription."
}
variable "apim_user_id" {
  description = "The ID of the User which should be assigned to this Subscription. "
}
variable "apim_product_id" {
  description = "The ID of the Product which should be assigned to this Subscription. "
}
