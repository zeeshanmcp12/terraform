terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.71.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "learntfrg"
    storage_account_name = "learntfsto"
    container_name       = "cn-tfstate"
    key                  = "dev-terraform.tfstate"
  }
}