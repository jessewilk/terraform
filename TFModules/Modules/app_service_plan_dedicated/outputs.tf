output "app_plan_name" {
  value = azurerm_app_service_plan.module.name
}
output "app_plan_id" {
  value = azurerm_app_service_plan.module.id
}
output "app_plan_max_workers" {
  value = azurerm_app_service_plan.module.maximum_number_of_workers
}
