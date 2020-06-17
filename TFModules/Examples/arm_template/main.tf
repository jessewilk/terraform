module "demo_arm_template" {
  source  = "../../Modules/arm_template_deployment"
  rg_name = data.azurerm_resource_group.rg.name

  deployment_name        = var.deployment_name
  arm_template_file_path = local.path_abs

  arm_parameters = local.arm_parameters
}

