resource "azurerm_virtual_network" "module" {
  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.rg_name
  address_space       = var.vnet_address_space

  #   subnet {
  #     name           = "subnet1"
  #     address_prefix = "10.0.1.0/24"
  #   }

  #   subnet {
  #     name           = "subnet2"
  #     address_prefix = "10.0.2.0/24"
  #   }

  #   subnet {
  #     name           = "subnet3"
  #     address_prefix = "10.0.3.0/24"
  #     security_group = var.nsg_id
  #   }

  tags = var.vnet_tags
}

