# Azure Resource Group Module

## Overview
  This module is used to create or update an Azure Resource Group.

  [Terraform Documentation](https://www.terraform.io/docs/providers/azurerm/r/resource_group.html)

## Required variables
- rg_name: Resource group name.
- rg_location:  Azure region for the resource.  Typically this will be the equal to the location for the resource group.

## Other important variables
- rg_tags: Should conform to the standard resource tagging conventions..

See the variables.tf file for other variables and their default settings.

