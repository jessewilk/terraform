resource "azurerm_storage_account_network_rules" "module" {
  storage_account_name = var.storage_name
  resource_group_name  = var.rg_name

  default_action             = var.storage_net_default_action
  ip_rules                   = var.storage_net_ip_rules
  virtual_network_subnet_ids = var.storage_net_subnet_ids
  bypass                     = var.storage_net_bypass
}
