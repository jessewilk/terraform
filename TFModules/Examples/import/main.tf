resource "azurerm_api_management" "module" {
  name                = var.apim_name
  location            = var.apim_location
  resource_group_name = var.rg_name
  publisher_name      = var.apim_publisher_name
  publisher_email     = var.apim_publisher_email

  sku_name = var.apim_sku_name

  policy {
    xml_content = <<XML
    <policies>
      <inbound />
      <backend />
      <outbound />
      <on-error />
    </policies>
XML
  }

  tags = var.apim_tags

}
