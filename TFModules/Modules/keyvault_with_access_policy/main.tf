resource "azurerm_key_vault" "module" {
  name                            = var.keyvault_name
  location                        = var.keyvault_location
  resource_group_name             = var.rg_name
  enabled_for_deployment          = var.keyvault_enabled_for_deployment
  enabled_for_template_deployment = var.keyvault_enabled_for_template_deployment
  enabled_for_disk_encryption     = var.keyvault_enabled_for_disk_encryption
  tenant_id                       = var.tenant_id

  sku_name = var.keyvault_sku

  access_policy = var.access_policies
  # access_policy {
  #   tenant_id = var.tenant_id

  #   # count     = length(var.user_objectid_list)
  #   # object_id = var.user_objectid_list[count.index]
  #   object_id = var.object_id

  #   key_permissions = var.keyvault_key_permissions
  #   secret_permissions = var.keyvault_secret_permissions
  #   certificate_permissions = var.keyvault_cert_permissions
  #   storage_permissions = var.keyvault_storage_permissions
  # }

  network_acls {
    default_action = var.network_action
    bypass         = "AzureServices"
  }

  tags = var.keyvault_tags
}

