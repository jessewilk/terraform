module "demo_ddos_plan" {
  source             = "../../Modules/ddos_plan"
  ddos_plan_name     = var.ddos_plan_name
  rg_name            = data.azurerm_resource_group.rg.name
  ddos_plan_location = var.ddos_location
  ddos_plan_tags     = var.ddos_tags
}

