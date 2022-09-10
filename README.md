# terraform

## terraform common terms
- Terraform project
- Terraform file
- Resources
- Providers
- Variables
- Input variables
- Module

## terraform file structure
root directory
  - /main.tf -> This file contains, locals (aka variables), modules, data sources to create resources.
  - /providers.tf -> This file contiains information about provider for example: azurerm, aws and gcp etc
  - /variables.tf -> This define the variables used with the terraform deployment. In general, these are input parameters that will be passed into terraform code at deployment time.
  - /output.tf -> Define variables to output from the terraform module or project.
  - /{customname}.tf -> custom module that we want to create