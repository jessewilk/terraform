resource "azurerm_template_deployment" "module" {
  name                = var.deployment_name
  resource_group_name = var.rg_name

  template_body = file("${var.arm_template_file_path}")
  #  template_body = file("../../ARMTemplates/${var.arm_template_file_name}")

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters = var.arm_parameters

  deployment_mode = "Incremental"
}