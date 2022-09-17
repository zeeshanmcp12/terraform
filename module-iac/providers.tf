provider "azurerm" {
  features {}

}

# terraform {
#   required_providers {
#     name = {
#       source  = "hashicorp/azurerm"
#       version = "~>2.0"
#     }
#   }
# }

data "azurerm_client_config" "current" {}