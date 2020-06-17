locals {
  tags = merge(data.azurerm_resource_group.kv.tags,
    map("Environment", var.environment),
    map("Resource Name", var.demo_kv_name),
    map("Location", data.azurerm_resource_group.kv.location)
  )

  admin_object_id_list = concat(var.adminuser_objectid_list, [data.azuread_service_principal.devops.id])
}
