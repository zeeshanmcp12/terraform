resource "azurerm_resource_group" "learntfrg"{
    name = "learntfrgweu"
    location = "West Europe"
}

resource "azurerm_storage_account" "learntfsto" {
    name = "learnstorageaccount"
    resource_group_name = azurerm_resource_group.learntfrg.name
    account_tier = "Standard"
    location = "West Europe"
    account_replication_type = "LRS" 
}

resource "azurerm_storage_container" "learntfcontainer" {
  name = "tfstcontainer"
  storage_account_name = azurerm_storage_account.learntfsto.name
  
}