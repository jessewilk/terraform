
#NIC Card

module "deploy_nic_sql" {
    source 							= "./modules/New-NetworkInterface"
    resource_group_name = module.deployRGCompute.name
  	location 						= module.deployRGCompute.location
	  nic_name 						= "${var.resource_prefix}-nic-sqlserver"
    ip_name             = "ip2"
    subnet_id 				  = data.azurerm_subnet.DevSubnet.id
    private_ip_address_allocation 	= var.private_ip_address_allocation
    resource_tags					= var.resource_tags
}


#WindowsVM - SQL Server

resource "azurerm_virtual_machine" "SQLServer" {
  name                  = "${var.resource_prefix}-SQL"
  location              = module.deployRGCompute.location
  resource_group_name   = module.deployRGCompute.name
  network_interface_ids = [module.deploy_nic_sql.id]
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
    name              = "${var.resource_prefix}-SQL-sos"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  /*
  # Optional data disks
  storage_data_disk {
    name          = "datadisk-count.index"
    create_option = "Empty"
    disk_size_gb  = "1023"
    lun           = "count.index"
    managed_disk_type = "Standard_LRS"
  }

    storage_data_disk {
    name          = "datadisk3"
    create_option = "Empty"
    disk_size_gb  = "1023"
    lun           = 2
    managed_disk_type = "Standard_LRS"
  }
    storage_data_disk {
    name          = "datadisk4"
    create_option = "Empty"
    disk_size_gb  = "1023"
    lun           = 3
    managed_disk_type = "Standard_LRS"
  }
*/
  os_profile {
    computer_name  = "${var.resource_prefix}-SQL"
    admin_username = "avid-admin"
    admin_password = "admin123-AAA"
  }
  os_profile_windows_config{
    provision_vm_agent        = true
    enable_automatic_upgrades = true
    timezone                  = "Eastern Standard Time"
  }


}
resource "azurerm_managed_disk" "external" {
  count                = "3"
  name                 = "${var.resource_prefix}-SQL-disk${count.index+1}"
  location             = module.deployRGCompute.location
  resource_group_name  = module.deployRGCompute.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "10"
}

resource "azurerm_virtual_machine_data_disk_attachment" "external" {
  count              = "3"
  managed_disk_id    = azurerm_managed_disk.external.*.id[count.index]
  virtual_machine_id = azurerm_virtual_machine.SQLServer.id
  lun                = count.index+10
  caching            = "ReadWrite"
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
}
*/


