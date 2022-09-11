resource "azurerm_resource_group" "resourceGroup"{
    name = "learntfrgweu"
    location = "West Europe"
}

resource "azurerm_storage_account" "storageAccount" {
    name = "learntfsto"
    resource_group_name = azurerm_resource_group.resourceGroup.name
    account_tier = "Standard"
    location = "West Europe"
    account_replication_type = "LRS" 
}

resource "azurerm_storage_container" "storageContainer" {
  name = "tfstcontainer"
  storage_account_name = azurerm_storage_account.storageAccount.name
}