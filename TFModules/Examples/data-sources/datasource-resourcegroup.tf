## Get the RG Info.  Also ensures that it exists.
data "azurerm_resource_group" "acr" {
  name = var.rg_name
}
