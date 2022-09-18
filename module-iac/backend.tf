terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.71.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-learningclouddevops-dev"
    storage_account_name = "stotfstatedev"
    container_name       = "cn-tfstate"
    key                  = "terraform.tfstate"
  }
}