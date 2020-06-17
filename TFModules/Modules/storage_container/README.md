# Azure Storage Account with Container Module

## Overview
  This module is used to create or update an Azure Storage Account with a container.

  [Terraform Documentation](https://www.terraform.io/docs/providers/azurerm/r/storage_blob.html)

## Required variables
- storage_name: Name should conform to the standard resource naming conventions..
- storate_location:  Azure region for the resource.  Typically this will be the equal to the location for the resource group.
- tenant_id: Use the tenant id for the currently logged in user/subscription. This value can be retrieved with a data block to "azurerm_client_config", so there is no need to include the value in a default or tfvars file.
- object_id: This is the Azure AD or SPN object id needed to assign the access policy.

## Other important variables
- storage_tags: Should conform to the standard resource tagging conventions..

See the variables.tf file for other variables and their default settings.

## Usage
See the /examples directory for usage and examples.
