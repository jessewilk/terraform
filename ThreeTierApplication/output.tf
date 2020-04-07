

output "deployRGCompute" {
  value = module.deployRGCompute.id
}

output "deployAPIServer" {
  value = azurerm_virtual_machine.APIServer.id
}

output "deployAPIServerNicId" {
  value = module.deploy_nic_api.id
}


output "deploySQLServer" {
  value = azurerm_virtual_machine.SQLServer.id
}
output "deploySQLServerNicId" {
  value = module.deploy_nic_sql.id
}
output "deploySQLServerIP" {
  value = module.deploy_nic_sql.private_ip_address
}

output "deployAPIServerIP" {
  value = module.deploy_nic_api.private_ip_address
}




