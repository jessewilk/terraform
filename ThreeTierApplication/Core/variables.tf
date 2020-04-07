/* Azure Environment Variables*/
variable "subscription_id"{
	description = "Enter Subscription Id for the Azure Subscription"
}
variable "client_id"{
	description = "Enter Azure AD Application id"
}
variable "client_secret"{
	description = "Enter Azure AD Application secret"
}
variable "tenant_id"{
	description = "Enter Azure AD Application Tenant Id"
}
variable "location"{
	description = "Enter location for resource group"
	default = "EAST US"
}


#Resource Group Variables
variable "resource_prefix"{
	description = "Enter resource prefix name"
	default = "AvidDev"
}


variable "resource_tags" {
	  type = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
  default = {
			"BudgetCategory"  = "DevResources"
			"Owner"           = "DEVOPS"
			"TeamName"        = "DEVOPS"
			"Department"      = "ENGINEERING"
			"Program"         = "DEVOPS"
			"Environment"     = "DEVOPS"
  }
}

#Vnet

variable "private_ip_address_allocation" {
	description = "how a private ip address will be assigned to nic, valid values - Static,Dynamic"
    default = "Dynamic"
    }

#Subnet
