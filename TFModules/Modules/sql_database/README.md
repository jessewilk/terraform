# Azure {{Resource Type}} Module

## Overview
  This module is used to create or update an Azure {{Resource Type}}.

  [Terraform Documentation]({{Url to the Terraform doc for the resource})

## Required variables
- {{prefix}}_name: Name should conform to the standard resource naming conventions..
- rg_name: Resource group name.
- {{prefix}}_location:  Azure region for the resource.  Typically this will be the equal to the location for the resource group.

## Other important variables
- {{prefix}}_tags: Should conform to the standard resource tagging conventions..
- {{List any other important variables that may need an override or special mention}}

See the variables.tf file for other variables and their default settings.

## Usage
See the /examples directory for usage and examples.


