variable "resource_group_name"{
	description = "Enter name for Azure Resource group"
}
variable "location"{
	description = "Enter resource location"
}
variable "vmss_name"{
	description = "Enter name for Azure Virtual Machine Scale Set"
}
variable "upgrade_policy"{
	description = "Enter upgrade policy for VMs in VM Scale Set"
}
variable "vmsku"{
	description = "Enter Virtual Machine Size"
}

variable "subnet_id"{
	description = "Enter Azure Subnet Id to associate with the VM"
}
variable "appgw_backend_pool_id"{
  type = "list"
	description = "Enter Application Gateway Backend Pool Id"
}
resource "azurerm_virtual_machine_scale_set" "vmss" {
  name = "var.vmss_name"
  location = "var.location"
  resource_group_name = "var.resource_group_name"
  upgrade_policy_mode = "var.upgrade_policy"

  sku {
    name = "var.vmsku"
    tier = "Standard"
    capacity = 2
  }

  storage_profile_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2016-Datacenter"
    version = "latest"
  }

  storage_profile_os_disk {
    name = ""
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
    os_type = "Windows"
  }

  storage_profile_data_disk {
    lun = 0
    caching = "ReadWrite"
    create_option = "Empty"
    disk_size_gb = 10
  }

  os_profile {
    computer_name_prefix = "substr(var.vmss_name, 0, 9)-computer"
    admin_username = "arindam"
    admin_password = "Abcd@12345"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = false
  	provision_vm_agent = true	
  }
  
  extension {
    name = "configDefaultSite"
    publisher = "Microsoft.Compute"
    type = "CustomScriptExtension"
    type_handler_version = "1.8"
    settings = <<SETTINGS
		{	
			"commandToExecute": "powershell -Executionpolicy Unrestricted Add-WindowsFeature Web-Server,Web-Asp-Net45,NET-Framework-Features;powershell Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"
		}
		SETTINGS
	}

  network_profile {
    name = "var.vmss_name-network-profile"
    primary = true

    ip_configuration {
      name = "var.vmss_name-ipconfig"
      subnet_id = "var.subnet_id"
      primary = true  
      application_gateway_backend_address_pool_ids = ["var.appgw_backend_pool_id"]  
    }
  }
}

