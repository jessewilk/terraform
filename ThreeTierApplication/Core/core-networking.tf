provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  version         = "~>1.32.0"
}

locals {
  #Local variables - add your subnet name
  subnetAppId = tolist(azurerm_virtual_network.coreVnet.subnet[*].id)[0]

}

#Core Networking Resource Group
module "deployRgNetworking" {
  source              = "../modules/New-ResourceGroup"
  resource_group_name = "core-networking"
  location            = var.location
  resource_tags       = var.resource_tags
}

resource "azurerm_virtual_network" "coreVnet" {
  name                = "core-vnet"
  location            = module.deployRgNetworking.location
  resource_group_name = module.deployRgNetworking.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  subnet {
    name           = "subnetApp"
    address_prefix = "10.0.1.0/24"
  }
  subnet {
    name           = "subnetWeb"
    address_prefix = "10.0.2.0/24"
  }
    subnet {
    name           = "subnetSql"
    address_prefix = "10.0.3.0/24"
  }
  tags = var.resource_tags
}

output "deployRgNetworking" {
  value = module.deployRgNetworking.id
}

output "coreVnet" {
  value = azurerm_virtual_network.coreVnet.id
}

output "subnetApp" {
  value = local.subnetAppId
}

output "subnetWeb" {
  value = tolist(azurerm_virtual_network.coreVnet.subnet[*].id)[1]
}

output "subnetSql" {
  value = tolist(azurerm_virtual_network.coreVnet.subnet[*].id)[2]
}


