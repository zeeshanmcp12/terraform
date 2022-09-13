resource "azurerm_storage_account" "storageAccount" {
    name = var.storage_account_name
    resource_group_name = var.resource_group_name
    account_replication_type = "LRS"
    account_tier = "Standard"
    tags = {
      "Environment" = var.tag
    }
  
}