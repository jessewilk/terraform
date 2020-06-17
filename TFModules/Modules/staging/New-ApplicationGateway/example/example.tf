variable "resource_group_name" {
  description = "azure resource group name"
}
variable "location"{
    description = "resource location"
}
variable "appgw_name_prefix"{
    description = "azure network security group name"
}
variable "appgw_tier" {
  description = "the tier for application gateway sku,possible values are Standard, Standard_v2, WAF and WAF_v2"
}
variable "appgw_sku" {
  description = "application gateway sku,possible values Standard_Small,Standard_Medium,Standard_Large,WAF_Medium,WAF_Large"
}
variable "appgw_frontend_type" {
  description = "application gateway frontend type, possible values internal,external"
}
variable "appgw_capacity" {
  description = "capacity of the sku to be used in the application gateway, value must be between 1 and 10"
  default = 2
}
variable "appgw_frontend_port" {
  description = "application gateway frontend port"
  default = 80
}
variable "vnet_name" {
  description = "name of virtual network to associate with the application gateway backend"
}
variable "vnet_resource_group" {
	description = "virtual network resource group name"
}
variable "subnet_name" {
	description = "subnet name to associate with the application gateway backend"
}
variable "pip_id" {
	description = "public ip address name to associate with the application gateway frontend"
}
variable "resourceTags" {
	type = map
	default = {
        "TeamName" = "DEVOPS"
        "Department" = "TECHNOLOGY SERVICES"
	}
	description = "A map of the tags to use on the resources that are deployed with this module."
}

module "deploy_appgw" {
    source              = "git::https://avidxchange.visualstudio.com/avidxchange/_git/avidxchange-terraform-modules//modules/New-ApplicationGateway"
    resource_group_name = "var.resource_group_name"
    location            = "var.location"
    appgw_name_prefix   = "var.appgw_name_prefix"
    appgw_tier          = "var.appgw_tier"
    appgw_sku           = "var.appgw_sku"
    appgw_frontend_type = "var.appgw_frontend_type"
    appgw_capacity      = "var.appgw_capacity"
    appgw_frontend_port = "var.appgw_frontend_port"
    vnet_name           = "var.vnet_name"
    vnet_resource_group = "var.vnet_resource_group"
    subnet_name         = "var.subnet_name"
    pip_id              = "var.pip_id"
    resourceTags        = "var.resourceTags"
}
