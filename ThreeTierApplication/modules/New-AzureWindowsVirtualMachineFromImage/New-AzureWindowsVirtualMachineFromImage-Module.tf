variable "resource_group_name"{
	description = "Enter name for Azure Resource group"
}
variable "vm_name"{
	description = "Enter Virtual Machine Name"
}
variable "nic_id"{
	description = "Enter id of Network Interface"
}
variable "as_id"{
	description = "Enter id of Availability Set"
}
variable "vm_size"{
	description = "Enter name for Azure VM Size"
}
variable "image_name"{
	description = "Azure custom user Image name"
}
variable "img_resource_group_name"{
	description = "Azure custom user Image resource group name"
}
variable "local_adminuser"{
	description = "Local admin user id for the new VM"
}
variable "local_adminpassword"{
	description = "Local admin password for the new VM"
}

data "azurerm_image" "image" {
	name = "var.image_name"
	resource_group_name = "var.img_resource_group_name"
}
data "azurerm_resource_group" "rg" {
	name = "var.resource_group_name"
}

resource "azurerm_virtual_machine" "vm" {
	name = "var.vm_name"
	location = "data.azurerm_resource_group.rg.location"
	resource_group_name = "var.resource_group_name"
	network_interface_ids = ["var.nic_id"]
	vm_size = "var.vm_size"
	availability_set_id = "var.as_id"
	delete_os_disk_on_termination = true
	delete_data_disks_on_termination = false	
	storage_image_reference {
	id = "data.azurerm_image.image.id"
	}
	os_profile {
	computer_name  = "var.vm_name"
	admin_username = "var.local_adminuser"
	admin_password = "var.local_adminpassword"
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

