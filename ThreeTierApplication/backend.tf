/*
terraform {
 backend "azurerm" {
	resource_group_name = "AvidX-DevQA-CloudAutomation-RG"
	storage_account_name = "iacdvterraformsa01"
	container_name = "terraform-state"
	key = "avidx-avidsuite-dev-az.tfstate"
	access_key = "WFPTM5aG4gKlXDl8LElyXuj2ijUFCEXQo1v/47WBXbAmZjV0hP0A3++6uTeb2vdJ709GgR35Zh+wTQLSXZDpAQ=="
 }
}
*/
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}