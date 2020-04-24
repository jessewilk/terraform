terraform {
  /*backend "local" {
    path = "./ThreeTier-appService.json"
  }
  backend "azurerm" {
    resource_group_name  = "core-networking"
    storage_account_name = "jwilkincsa"
    container_name       = "terraform-state"
    key                  = "ThreeTier-appService.tfstate"
  }
  */
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "cardinalsolutions"

    workspaces {
      name = "jwilk-terraform"
    }
  }

}

# Azure Environment Variables
variable "subscription_id" {
  description = "Enter Subscription Id for the Azure Subscription"
}
variable "client_id" {
  description = "Enter Azure AD Application id"
}
variable "client_secret" {
  description = "Enter Azure AD Application secret"
}
variable "tenant_id" {
  description = "Enter Azure AD Application Tenant Id"
}

variable "location" {
  type    = string
  default = "EAST US 2"
}

variable "appVars" {
  type = map
}

variable "rgs" {
  type = map
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  version         = "=2.0.0.0"
  features {}
}

locals {
    appOwner = "jwilk"
    environment = "dev"
    namingPrefix = ""
   settings = [
        {
            name                          = "intIp1"
            subnet_id                     = azurerm_subnet.subnet["sandbox-subnet"].id
            private_ip_address_allocation = "Dynamic"
            primary                       = true
        },
        {
            name                          = "intIp2"
            subnet_id                     = azurerm_subnet.subnet["sandbox-subnet"].id
            private_ip_address_allocation = "Dynamic"
            primary                       = false
        }]
    }


resource "azurerm_resource_group" "rg" {
  count    = var.appVars.count
  name     = "${var.appVars.name}_${count.index + 1}"
  location = var.location
}

resource "azurerm_resource_group" "rg1" {
  for_each = var.rgs
  name     = each.key
  location = each.value
}

module "web_app" {
  source = "innovationnorway/web-app/azurerm"

  name = "jwilk-terraform-webapp"

  resource_group_name = azurerm_resource_group.rg1["jwilkRg3"].name

  runtime = {
    name    = "dotnetcore"
    version = "2.2"
  }
}



#Create a few Network resources

resource "azurerm_virtual_network" "vnet" {
  name                = "sandbox-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg[0].name
}


resource "azurerm_subnet" "subnet" {
  for_each = {
    sandbox-subnet  = "10.0.2.0/24"
    sandbox-subnet1 = "10.0.3.0/24"
  }
  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg[0].name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = each.value
}

resource "azurerm_network_interface" "nics" {
  for_each = {
    nic1 = {
      location       = azurerm_resource_group.rg[0].location
      subnet_id      = azurerm_subnet.subnet["sandbox-subnet"].id
      resource_group = azurerm_resource_group.rg[0].name
    }
    nic2 = {
      location       = azurerm_resource_group.rg1["jwilkRg3"].location
      subnet_id      = azurerm_subnet.subnet["sandbox-subnet1"].id
      resource_group = azurerm_resource_group.rg1["jwilkRg3"].name
    }
  }
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_network_interface" "dynamicNic" {
    name                = "testNic"
    location            = "East US 2"
    resource_group_name = "jwilkRg4"

  dynamic "ip_configuration" {
    for_each = local.settings
    content {
            name                          = ip_configuration.value["name"]
            subnet_id                     =  ip_configuration.value["subnet_id"]
            private_ip_address_allocation = ip_configuration.value["private_ip_address_allocation"]
            primary                       = ip_configuration.value["primary"]
    }
  }

}




output "resourceGroups" {
    value = upper(join(",",azurerm_resource_group.rg[*].name))
    description = "The list of resource groups"
}

output "resourceGroups1" {
    value = {for rgs in azurerm_resource_group.rg1 : rgs.name => upper(rgs.id)} #azurerm_resource_group.rg1
    description = "The list of resource groups"
}

output "nicCards" {
    value = upper(join(",",[for nic in azurerm_network_interface.nics : nic.name]))
}

output "dynamicNic" {
    value = azurerm_network_interface.dynamicNic.name
}

