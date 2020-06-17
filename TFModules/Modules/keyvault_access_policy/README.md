# Azure Key Vault Access Policy Module

## Overview
  This module is used to create or update an Azure Key Vault Access Policy.

  [Terraform Documentation](https://www.terraform.io/docs/providers/azurerm/r/key_vault_access_policy.html)

## Required variables
- keyvault_id: Key vault Id.
- tenant_id: Use the tenant id for the currently logged in user/subscription. This value can be retrieved with a data block to "azurerm_client_config", so there is no need to include the value in a default or tfvars file.
- object_id: This is the Azure AD or SPN object id needed to assign the access policy.

## Other important variables
- key_permissions: Defaults to Get only.  Send in a list of required permissions for higher access.
- secret_permissions: Defaults to Get only.  Send in a list of required permissions for higher access.
- certificate_permissions: Defaults to Get only.  Send in a list of required permissions for higher access.
- storage_permissions: Defaults to Get only.  Send in a list of required permissions for higher access.

See the variables.tf file for other variables and their default settings.

## Usage
See the /examples directory for usage and examples.
