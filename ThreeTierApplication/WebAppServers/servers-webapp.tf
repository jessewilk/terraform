provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  version         = "~>1.32.0"
}

locals {
  #Local variables 
}



data "azurerm_virtual_network" "coreVnet" {
  name                = "core-vnet"
  resource_group_name = "core-networking"
}

data "azurerm_subnet" "subnetIds" {
  for_each             = toset(data.azurerm_virtual_network.coreVnet.subnets)
  name                 = each.key
  virtual_network_name = data.azurerm_virtual_network.coreVnet.name
  resource_group_name  = data.azurerm_virtual_network.coreVnet.resource_group_name
}



#ResourceGroup
module "deployRGCompute" {
  source              = "../modules/New-ResourceGroup"
  resource_group_name = "${var.resource_prefix}-rg"
  location            = var.location
  resource_tags       = var.resource_tags
}
#Build Web Server Nic Card 

module "deploy_nic_web" {
  source                        = "../modules/New-NetworkInterface"
  resource_group_name           = module.deployRGCompute.name
  location                      = module.deployRGCompute.location
  nic_name                      = "${var.resource_prefix}-nic-web"
  ip_name                       = "${var.resource_prefix}-ip1-web"
  subnet_id                     = data.azurerm_subnet.subnetIds["subnetWeb"].id
  private_ip_address_allocation = var.private_ip_address_allocation
  resource_tags                 = var.resource_tags
}

module "deploy_nic_web1" {
  source                        = "../modules/New-NetworkInterface"
  resource_group_name           = module.deployRGCompute.name
  location                      = module.deployRGCompute.location
  nic_name                      = "${var.resource_prefix}-nic-web1"
  ip_name                       = "${var.resource_prefix}-ip1-web1"
  subnet_id                     = data.azurerm_subnet.subnetIds["subnetWeb"].id
  private_ip_address_allocation = var.private_ip_address_allocation
  resource_tags                 = var.resource_tags
}


module "deploy_nic_app" {
  source                        = "../modules/New-NetworkInterface"
  resource_group_name           = module.deployRGCompute.name
  location                      = module.deployRGCompute.location
  nic_name                      = "${var.resource_prefix}-nic-app"
  ip_name                       = "${var.resource_prefix}-ip1-app"
  subnet_id                     = data.azurerm_subnet.subnetIds["subnetApp"].id
  private_ip_address_allocation = var.private_ip_address_allocation
  resource_tags                 = var.resource_tags
}



#Web Virtual Machine

resource "azurerm_virtual_machine" "webServers" {
  for_each = {
      web  = [module.deploy_nic_web.id,"${var.resource_prefix}-web","Standard_D2_v3"]
      web1 = [module.deploy_nic_web1.id,"${var.resource_prefix}-web1","Standard_D4_v3"]
  }
  name                  = each.key
  location              = module.deployRGCompute.location
  resource_group_name   = module.deployRGCompute.name
  network_interface_ids = [each.value[0]]
  vm_size               = each.value[2]

  # This means the OS Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in alls cases.
  delete_os_disk_on_termination = true

  # This means the Data Disk Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in all cases.
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${each.value[1]}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Optional data disks
  storage_data_disk {
    name              = "${each.value[1]}-datadisk"
    create_option     = "Empty"
    disk_size_gb      = "1023"
    lun               = 0
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = each.value[1]
    admin_username = "jwilk-admin"
    admin_password = "admin123-AAA"
  }
  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
    timezone                  = "Eastern Standard Time"
  }


}




#App Virtual Machine

resource "azurerm_virtual_machine" "appServer" {
  name                  = "${var.resource_prefix}-app"
  location              = module.deployRGCompute.location
  resource_group_name   = module.deployRGCompute.name
  network_interface_ids = [module.deploy_nic_app.id]
  vm_size               = "Standard_D2_v3"

  # This means the OS Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in alls cases.
  delete_os_disk_on_termination = true

  # This means the Data Disk Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in all cases.
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.resource_prefix}-app-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Optional data disks
  storage_data_disk {
    name              = "${var.resource_prefix}-app-datadisk"
    create_option     = "Empty"
    disk_size_gb      = "1023"
    lun               = 0
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.resource_prefix}-app"
    admin_username = "jwilk-admin"
    admin_password = "admin123-AAA"
  }
  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
    timezone                  = "Eastern Standard Time"
  }


}

output "coreVnet" {
  value = data.azurerm_virtual_network.coreVnet.id
}

output "subnetIds" {
  value = [for value in data.azurerm_subnet.subnetIds : value.id]
}

output "nic_web" {
  value = module.deploy_nic_web.id
}

output "webServer" {
  value = azurerm_virtual_machine.webServers
}

output "nic_app" {
  value = module.deploy_nic_app.id
}

output "appServer" {
  value = azurerm_virtual_machine.appServer
}




/*
#Join to Domain
module "deploy_domjoinextn" {
  source 				       	  = "git::https://avidxchange.visualstudio.com/avidxchange/_git/avidxchange-terraform-modules//modules/VM_Extension_Domain_Join"
  resource_group_name 	  = "module.deployRG.name"
	location 			        	= "module.deployRG.location"
	vm_name			         		= "azurerm_virtual_machine.APIServer.name"
	domain_name	      		 	= "var.domain_name"
	ou_name			 	        	= "var.ou_name"
	domain_user_name	     	= "var.domain_user_name"
	domain_user_password   	= "var.domain_user_password"
	resourceTags 			      = "${var.resource_tags}"
*/


