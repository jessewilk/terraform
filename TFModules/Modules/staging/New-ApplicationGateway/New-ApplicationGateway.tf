variable "resource_group_name" {
	description = "azure resource group name"
}
variable "location" {
	description = "resource location"
}
variable "appgw_name_prefix" {
	description = "application gateway name prefix"
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
variable "appgw_frontend_portocol" {
  description = "application gateway frontend listener protocol.valid values, Http,Https"
  default = "Http"
}
variable "appgw_backend_port" {
  description = "application gateway backend port"
  default = 80
}
variable "appgw_backend_portocol" {
  description = "application gateway backend portocol.valid values, Http,Https"
  default = "Http"
}
variable "request_timeout" {
  description = "backend request timeout value in seconds. valid values can be in the range of 1 to 86400"
  default = "1"
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
variable "resourceTags"{
	type = map
	description = "A map of the tags to use on the resources that are deployed with this module."
}

#Terraform Data resource to retireve the virtual network id from name and resource group
data "azurerm_virtual_network" "vnet" {
  name                = "var.vnet_name"
  resource_group_name = "var.vnet_resource_group"
}

locals {
  appgw_name = "var.appgw_name_prefix-AG"
  waf_name = "var.appgw_name_prefix-WAF"  
  vnet_id = "data.azurerm_virtual_network.vnet.id"
  subnet_id = "local.vnet_id}/subnets/${var.subnet_name"
  backend_address_pool_name = "var.appgw_name_prefix-beapool"
  frontend_port_name = "var.appgw_name_prefix-feport"
  frontend_ip_configuration_name = "var.appgw_name_prefix-ipcfg"
  backend_http_settings_name = "var.appgw_name_prefix-behttp"
  http_listener_name = "var.appgw_name_prefix-httplstner"
  request_routing_rule_name = "var.appgw_name_prefix-rqrtrule"
  appgwCount = "var.appgw_tier == "Standard" || var.appgw_tier == "Standard_v2" ? 1 : 0"
  wafCount = "var.appgw_tier == "WAF" || var.appgw_tier == "WAF_v2" ? 1 : 0"
}

// Application Gateway Deployment/WAF deployment section based on tier selection
resource "azurerm_application_gateway" "appgw" {
  count                   = "local.appgwCount"
  name                    = "local.appgw_name"
  resource_group_name     = "var.resource_group_name"
  location                = "var.location"
  tags						        = "var.resourceTags"
  sku {
    name                  = "var.appgw_sku"
    tier                  = "var.appgw_tier"
    capacity              = "var.appgw_capacity"
  }

  gateway_ip_configuration {
    name                  = "var.appgw_name_prefix-ipconfig"
    subnet_id             = "local.subnet_id"
  }

  frontend_port {
    name                  = "local.frontend_port_name"
    port                  = "var.appgw_frontend_port"
  }

  frontend_ip_configuration {
    name                  = "local.frontend_ip_configuration_name"
    public_ip_address_id  = "var.appgw_frontend_type == "internal" ? "" : var.pip_id "
    subnet_id             = "var.appgw_frontend_type == "internal" ? local.subnet_id : """
  }

  backend_address_pool {
    name                  = "local.backend_address_pool_name"
  }

  backend_http_settings {
    name                  = "local.backend_http_settings_name"
    cookie_based_affinity = "Disabled"
    port                  = "var.appgw_backend_port"
    protocol              = "var.appgw_backend_portocol"
    request_timeout       = "var.request_timeout"
  }

  http_listener {
    name                            = "local.http_listener_name"
    frontend_ip_configuration_name  = "local.frontend_ip_configuration_name"
    frontend_port_name              = "local.frontend_port_name"
    protocol                        = "var.appgw_frontend_portocol"
  }

  request_routing_rule {
    name                        = "local.request_routing_rule_name"
    rule_type                   = "Basic"
    http_listener_name          = "local.http_listener_name"
    backend_address_pool_name   = "local.backend_address_pool_name"
    backend_http_settings_name  = "local.backend_http_settings_name"
  }   
}

resource "azurerm_application_gateway" "waf" {
  count                 = "local.wafCount"
  name                  = "local.waf_name"
  resource_group_name   = "var.resource_group_name"
  location              = "var.location"

  sku {
    name              = "var.appgw_sku"
    tier              = "var.appgw_tier"
    capacity          = "var.appgw_capacity"
  }

  gateway_ip_configuration {
    name              = "var.appgw_name_prefix-ipconfig"
    subnet_id         = "local.subnet_id"
  }

  frontend_port {
    name              = "local.frontend_port_name"
    port              = "var.appgw_frontend_port"
  }

  frontend_ip_configuration {
    name                  = "local.frontend_ip_configuration_name"
    public_ip_address_id  = "var.appgw_frontend_type == "internal" ? "" : var.pip_id "
    subnet_id             = "var.appgw_frontend_type == "internal" ? local.subnet_id : """
  }

  backend_address_pool {
    name            = "local.backend_address_pool_name"
  }

  backend_http_settings {
    name                  = "local.backend_http_settings_name"
    cookie_based_affinity = "Disabled"
    port                  = "var.appgw_backend_port"
    protocol              = "var.appgw_backend_portocol"
    request_timeout       = "var.request_timeout"
  }

  http_listener {
    name                            = "local.http_listener_name"
    frontend_ip_configuration_name  = "local.frontend_ip_configuration_name"
    frontend_port_name              = "local.frontend_port_name"
    protocol                        = "var.appgw_frontend_portocol"
  }

  request_routing_rule {
    name                        = "local.request_routing_rule_name"
    rule_type                   = "Basic"
    http_listener_name          = "local.http_listener_name"
    backend_address_pool_name   = "local.backend_address_pool_name"
    backend_http_settings_name  = "local.backend_http_settings_name"
  }  

  waf_configuration {
    enabled           = "true"
    firewall_mode     = "Detection"
    rule_set_type     = "OWASP"
    rule_set_version  = "3.0"
  } 
}
