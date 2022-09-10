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

## terraform command
- terraform init -> This command initializes the current directory of terraform files.
- terraform plan -> Process the terraform files and create an execution plan for whatever the resources has written in infrastructure as code in terraform files.
- terrafrom apply -> Execute the plan to create the resources and save the state of infrastructure in terraform state file.
- terraform destroy -> Destroy everything (OR delete resources). In simple words, "Tear it all down".
- terraform -h -> terraform help
- terraform -version -> terraform version