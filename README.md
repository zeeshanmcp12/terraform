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
- terraform plan -out=deploy.tfplan -> Create terraform plan and save it in deploy.tfplan file to use with terraform apply command to deploy the infrastructure.
  - terraform apply "deploy.tfplan"
  - This is also usefull when we want to automate the process of deploying/creating resources using terraform
  - We can create one pipeline to build the terraform files (using terraform plan)
  - We can create another pipeline to deploy/create the resources using terraform apply.
- terraform show -> to show/inspect the complete state of infrastructure.
- terraform destroy -target -> delete only the specific resource and not the entire infrastrucuter by looking into the .tfstate file.
- terraform plan -destroy -> destroy the infrastructure that have define in current plan
- terraform fmt -> Rewrites all terraform configuration files in a well presented and easy to read format. Similar to golang.
- terraform validate -> very usefull command to see if configuration is valid or not. It also indicate if any property (attribute) is missing in a resource etc.
- terraform plan -var-file="dev.tfvars"
- terraform import -> to import the existing resource


### Command specific notes
- terraform destroy
  - This command destroy the infrastructure
  - terraform plan -destroy -out="deploy.tfplan"
    - This will create an execution plan to delete the resources
    - terraform apply "deploy.tfplan"
      - This will apply the execution plan we created above.
- terraform validate
  - A must run command before executing terraform plan
- terraform plan -var-file="dev.tfvars"
  - If we don't want to provide default values in 'variables.tf' file and pick the var values from '*.tfvars' file.
  - In this case, we can create tfvars according to our environments for example, dev, stage, prod etc
- terraform init -backend-config storage_account_name=learntfsto -backend-config container_name=cn-learntf -backend-config resource_group_name=learntfrg -backend-config key=dev-terraform.tfstate


### Notes
- Execute terraform init for the first time
  - Creates .terraform.lock.hcl to store/record the provider information. This is for guarantee if we want to exeucte terraform init in furture.
  - Create .terraform folder to contain provider related file. This folder has been git ignored.
  - backend
    - backend refers to the backend being used in terraform. It would be azurerm (for Azure) and local. So the attributes starting with backend relates to configuration as below:
    - backendServiceArm
      - This is the config name for service connection in terraform when working with azure devops.
    - backendAzureRmResourceGroupName
      - Rg having storage account that has container which contains tfstate file.
    - backendAzureRmStorageAccountName
      - Storage account to host container for state file.
    - backendAzureRmContainerName
      - Container to host tf state file.
    - backendAzureRmKey
      - tf state file. The name could be anything. for example dev-terraform.tfstate

## Syntax
- Provider
  - provider "azurerm" {}
- Resource
  - resource <provider> <name>
  - resource "azurerm_resource_group" "learnrg" {}
- Link any resource with other for example, storage account will be created in a resource group
  - This will be a property of `resource "azurerm_storage_account" "storagename"{ resource_group_name = azurerm_resource_group.learnrg.name}


## Remember these four bullet points!
- Providers represent a cloud provider or a local provider
- Resources can be invoked to create/update infrastructure locally or in the cloud
- State is representation of the infrastructure created/updated by Terraform
- Data Sources are ???read-only??? resources

## Azure specific notes
- We must have to set the context (azure subscription) in which we want to create the resources using terraform
- This context has to be created by azure cli command 'az account set --subscription <subscription_id-name>'
- azurerm_client_config
  - We can use this as data source to get the client id, object id, tenant id and subscription id. for example:
```
data "azurerm_client_config" "current" {
}
output "account_id" {
  data.azurerm_client_config.current.client_id
}
```

## Output from child module
In order to get the outputs from child modules, we need to add them in an Output.tf file of root module with below syntax:
```
output "name" {
  value = module.rg.name
}
```

## Azure pipeline specific notes
- We don't need to use following variables in `terraform plan` task once it's initialized in `terraform init` task:
  - backendServiceArm: $(backendServiceConnection)
  - backendAzureRmResourceGroupName: $(tfBackendResourceGroupName)
  - backendAzureRmStorageAccountName: $(tfBackendStorageAccountName)
  - backendAzureRmContainerName: $(tfBackendContainerName)
  - backendAzureRmKey: 'terraform.tfstate'
- environmentServiceNameAzureRM: $(backendServiceConnection)
  - this one is required in `terraform plan` task to authenticate with our subscription.
- Testing CI trigger