# Introduction
This repository contains Terraform Modules and Examples to use in any Azure IaC implementation.

# Getting Started
1.	Required Local Tools
    1.  Azure CLI
    2.  Terraform CLI
2.	Optional Tools and Extensions
    1.  Visual Studio Code
    2.  VS Code Azure Terraform extension
    3.  VS Code Advanced Terraform Snippets extension
    4.  VS Code Terraform Doc Snippets extension
    5.  VS Code vscode-terraform1.12 extension

# Build and Test
Clone this repo locally.

In Azure:
- Create a resource group or identify one you want to use.

In the desired Example folder:
- Copy/Paste the test.tfvars.example file.  Name the new file test.tfvars.  (the .gitignore prevents tfvars files from pushing)
- Edit the test.tfvars file, changing the `rg_name` to your resource group name.  Change any other settings you want.
- Open a terminal or command prompt that is pointing to the Example folder.
- In the terminal run these commands:
  - terraform init
  - terraform validate
  - terraform plan -var-file test.tfvars
  - terraform apply -var-file test.tfvars
- The above commands will create the resources in the example.
- To destroy the resources, run:
  - terraform destroy -var-file test.tfvars
- To reset everything locally:
  - Delete the `.terraform` folder.
  - Delete the `*.tfstate` and `*.tfstate.backup` files.


