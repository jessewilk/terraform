/*terraform {
 backend "azurerm" {
	resource_group_name = "MyHomeLab"
	storage_account_name = "ahterraformremotestate"
	container_name = "terraformstate"
	key = "LinuxVM.tfstate"
	access_key = "[ENTER BLOB ACCESS KEY HERE]"
 }
}
*/
terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}