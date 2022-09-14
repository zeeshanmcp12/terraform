resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storageAccount" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_storage_container" "storageContainer" {
  name                 = var.storage_account_container
  storage_account_name = azurerm_storage_account.storageAccount.name
}