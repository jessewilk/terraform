variable "resource_group_name"{
	description = "Enter name for Azure Resource group"
}
variable "location"{
	description = "Enter resource location"
}
variable "vm_name"{
	description = "Enter Virtual Machine Name"
}
variable "vmsku"{
	description = "Enter Virtual Machine Size"
}
variable "nic_name"{
	description = "Enter Virtual Machine NIC name"
}
variable "subnet_id"{
	description = "Enter Azure Subnet Id to associate with the VM"
}
variable "vnet_name"{
	description = "Enter Azure Virtual network Name"
}
variable "public_ip_id"{
	description = "Enter Id for Public IP Address for the VM"
}
variable "administrator_login"{
	description = "Local admin user id for the new VM"
}
variable "administrator_login_password"{
	description = "Local admin password for the new VM"
}
variable "depends_on" { 
	default = [], 
	type = "list"
}
resource "azurerm_network_interface" "vmnic"{
	name = "var.nic_name"
	location = "var.location"
	resource_group_name = "var.resource_group_name"
	ip_configuration {
		name = "ipconfig1"
		subnet_id = "var.subnet_id"
		private_ip_address_allocation = "dynamic"
		public_ip_address_id  = "var.public_ip_id"
	}
}

output "private_ip"{
	value = "azurerm_network_interface.vmnic.private_ip_address"
}

resource "azurerm_virtual_machine" "vm" {
	name = "var.vm_name"
	location = "var.location"
	resource_group_name = "var.resource_group_name"
	network_interface_ids = ["azurerm_network_interface.vmnic.id"]
	vm_size = "var.vmsku"
	delete_os_disk_on_termination = true
	delete_data_disks_on_termination = false	
	storage_image_reference {
		publisher = "MicrosoftWindowsServer"
		offer     = "WindowsServer"
		sku       = "2016-Datacenter"
		version   = "latest"
	}
	os_profile {
		computer_name  = "var.vm_name"
		admin_username = "arindam"
		admin_password = "Abcd@12345"
	}
	storage_os_disk {
		name = "var.vm_name-DISK1"
		caching = "ReadWrite"
		create_option = "FromImage"
		managed_disk_type = "Standard_LRS"
		os_type = "Windows"
	}
	os_profile_windows_config{
		timezone = "Eastern Standard Time"
	}	
}

output "vm_id"{
	value = "azurerm_virtual_machine.vm.id"
}

