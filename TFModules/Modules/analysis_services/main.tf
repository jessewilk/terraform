resource "azurerm_analysis_services_server" "module" {
  name                    = var.analysis_name
  location                = var.analysis_location
  resource_group_name     = var.rg_name
  sku                     = var.analysis_sku
  admin_users             = var.analysis_admins
  enable_power_bi_service = true

  backup_blob_container_uri = var.analysis_sas_uri

  ipv4_firewall_rule {
    name        = var.analysis_firewall_rule
    range_start = var.analysis_fw_range_start
    range_end   = var.analysis_fw_range_end
  }

  tags = var.analysis_tags
}

