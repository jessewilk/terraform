locals {
  tags = merge(data.azurerm_resource_group.kv.tags,
    map("Environment", var.environment),
    map("Resource Name", var.demo_kv_name),
    map("Location", data.azurerm_resource_group.kv.location)
  )

  admin_object_id_list = concat(var.adminuser_objectid_list, [data.azuread_service_principal.devops.id])

  admin_access_policies = [
    {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = data.azuread_service_principal.devops.id
      application_id          = null #data.azuread_service_principal.devops.application_id
      key_permissions         = var.keyvault_admin_key_permissions
      secret_permissions      = var.keyvault_admin_secret_permissions
      certificate_permissions = var.keyvault_admin_cert_permissions
      storage_permissions     = var.keyvault_admin_storage_permissions
    },
    {
      tenant_id               = data.azurerm_client_config.current.tenant_id
      object_id               = "ea46184f-b0b5-497d-9759-0717474e04ec"
      application_id          = null #data.azuread_service_principal.devops.application_id
      key_permissions         = var.keyvault_admin_key_permissions
      secret_permissions      = var.keyvault_admin_secret_permissions
      certificate_permissions = var.keyvault_admin_cert_permissions
      storage_permissions     = var.keyvault_admin_storage_permissions
    }
  ]
}
