resource "azurerm_storage_account" "module" {
  name                     = var.storage_name
  resource_group_name      = var.rg_name
  location                 = var.storage_location
  account_tier             = var.storage_tier
  account_replication_type = var.storage_repl_type

  tags = var.storage_tags
}

resource "azurerm_storage_container" "module" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.module.name
  container_access_type = var.container_access_type
}

