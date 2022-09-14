backend "azurerm" {
    resource_group_name = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name = var.storage_account_container
    key = "dev-terraform.tfstate"
}