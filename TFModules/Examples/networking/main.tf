module "demo_vnet" {
  source        = "../../Modules/vnet"
  vnet_name     = var.vnet_name
  rg_name       = data.azurerm_resource_group.rg.name
  vnet_location = data.azurerm_resource_group.rg.location

  vnet_address_space = var.vnet_address_space

  vnet_tags = var.vnet_tags
}

module "demo_subnet1" {
  source      = "../../Modules/subnet"
  vnet_name   = module.demo_vnet.vnet_name
  subnet_name = var.subnet1_name
  rg_name     = data.azurerm_resource_group.rg.name

  subnet_address_prefix = var.subnet1_address_prefix

  service_endpoints = []

  subnet_tags = var.vnet_tags
}

module "demo_subnet2" {
  source      = "../../Modules/subnet"
  vnet_name   = module.demo_vnet.vnet_name
  subnet_name = var.subnet2_name
  rg_name     = data.azurerm_resource_group.rg.name

  subnet_address_prefix = var.subnet2_address_prefix

  service_endpoints = var.service_endpoints

  subnet_tags = var.vnet_tags
}

