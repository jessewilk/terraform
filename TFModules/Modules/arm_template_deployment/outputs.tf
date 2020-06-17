
output "arm_outputs" {
  value = azurerm_template_deployment.module.outputs[*]
}
