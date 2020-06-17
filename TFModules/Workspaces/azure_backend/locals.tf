locals {

  // Resource Names
  keyvault_name    = "kv-${var.product_code}-${var.component_devops}-${var.geo_code}-${var.environment}"
  app_config_name  = "cfg-${var.product_code}-${var.component_devops}-${var.geo_code}-${var.environment}"
  storageacct_name = "st${var.product_code}${var.component_devops}${var.geo_code}${var.environment}"
  vnet_name        = "vnet-${var.product_code}-${var.component_devops}-${var.geo_code}-${var.environment}"

  admin_object_id_list = var.admin_objectid_list #concat(var.admin_objectid_list, [data.azuread_service_principal.devops.id])

  common_tags = {}
}
