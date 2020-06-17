# output "keyvault_all" {
#   value = data.azurerm_key_vault.appservices
# }
output "keyvault_policy" {
  value = data.azurerm_key_vault.appservices.access_policy[0]
}
