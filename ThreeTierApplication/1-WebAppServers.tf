



#ResourceGroup
module "deployRGCompute" {
	source = "./modules/New-ResourceGroup"
	resource_group_name = "${var.resource_prefix}-rg"
	location = var.location
  resource_tags =  var.resource_tags
}

#NIC Card

module "deploy_nic_api" {
    source 							= "./modules/New-NetworkInterface"
    resource_group_name 			= module.deployRGCompute.name
  	location 						= module.deployRGCompute.location
	  nic_name 						= "${var.resource_prefix}-nic-api"
    ip_name             = "ip1"
    subnet_id 				  = data.azurerm_subnet.DevSubnet.id
    private_ip_address_allocation 	= var.private_ip_address_allocation
    resource_tags					= var.resource_tags
}


#WindowsVM - API Server

resource "azurerm_virtual_machine" "APIServer" {
  name                  = "${var.resource_prefix}-API"
  location              = module.deployRGCompute.location
  resource_group_name   = module.deployRGCompute.name
  network_interface_ids = ["module.deploy_nic_api.id"]
  vm_size               = "Standard_F2"

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
    name              = "${var.resource_prefix}-API-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Optional data disks
  storage_data_disk {
    name          = "${var.resource_prefix}-API-datadisk"
    create_option = "Empty"
    disk_size_gb  = "1023"
    lun           = 0
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.resource_prefix}-API"
    admin_username = "avid-admin"
    admin_password = "admin123-AAA"
  }
  os_profile_windows_config{
    provision_vm_agent        = true
    enable_automatic_upgrades = true
    timezone                  = "Eastern Standard Time"
  }


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


