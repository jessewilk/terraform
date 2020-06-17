# Azure API Management API Module

## Overview
  This module is used to create or update an Azure API Management API.

  [Terraform Documentation](https://www.terraform.io/docs/providers/azurerm/r/api_management_api.html)

## Required variables
- api_name: Name should conform to the standard resource naming conventions..
- rg_name: Resource group name.
- api_management_name: The Name of the API Management Service where this API should be created. Changing this forces a new resource to be created.
- api_revision: The Revision which used for this API.
- api_display_name: The display name of the API.
- api_path: The Path for this API Management API, which is a relative URL which uniquely identifies this API and all of it's resource paths within the API Management Service.
- api_content_format: he format of the content from which the API Definition should be imported. Possible values are: `swagger-json`, `swagger-link-json`, `wadl-link-json`, `wadl-xml`, `wsdl` and `wsdl-link`.  Default is `swagger-link-json`.
- api_content_value: The Content from which the API Definition should be imported. When a content_format of `*-link-*` is specified this must be a URL, otherwise this must be defined inline.
- subscr_key_header: The name of the HTTP Header which should be used for the Subscription Key. Default is `Ocp-Apim-Subscription-Key`.
- subscr_key_query: The name of the QueryString parameter which should be used for the Subscription Key. Default is `subscription-key`.

See the `variables.tf` file for other variables and their default settings.

## Usage
See the /examples directory for usage and examples.

