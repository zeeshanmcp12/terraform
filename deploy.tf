resource "azurerm_resource_group" "learntfrg"{
    name = "learntfrg"
    location = "West Europe"
}

resource "azurerm_storage_account" "learnstorageaccount" {
    name = "learnstorageaccount"
    resource_group_name = azurerm_resource_group.learntfrg.name
    account_tier = "Standard"
    location = "West Europe"
    account_replication_type = "LRS"
  
}