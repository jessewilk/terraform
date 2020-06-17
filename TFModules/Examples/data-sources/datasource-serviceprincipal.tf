# Requires azuread provider.

data "azuread_service_principal" "devops" {
  display_name = var.devops_sp_name
}

