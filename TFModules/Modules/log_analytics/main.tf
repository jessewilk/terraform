resource "azurerm_log_analytics_workspace" "module" {
  name                = var.log_analytics_workspace_name
  location            = var.log_analytics_location
  resource_group_name = var.rg_name
  sku                 = var.log_analytics_workspace_sku

  tags = var.log_analytics_tags
}

resource "azurerm_log_analytics_solution" "module" {
  solution_name         = "ContainerInsights"
  location              = var.log_analytics_location
  resource_group_name   = var.rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.module.id
  workspace_name        = azurerm_log_analytics_workspace.module.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

