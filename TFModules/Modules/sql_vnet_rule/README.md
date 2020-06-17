# Azure SQL Vnet Rule Module

## Overview
  This module is used to create or update an Azure SQL Vnet Rule.

  [Terraform Documentation](https://www.terraform.io/docs/providers/azurerm/r/sql_virtual_network_rule.html)

## Required variables
- sql_vnet_rule_name: Name should conform to the standard resource naming conventions..
- rg_name: Resource group name.
- subnet_id

## Other important variables
- sql_vnet_rule_tags: Should conform to the standard resource tagging conventions..
- {{List any other important variables that may need an override or special mention}}

See the variables.tf file for other variables and their default settings.

## Usage
See the /examples directory for usage and examples
