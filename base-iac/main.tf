resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags = {
    Environment : var.tags
  }

}

resource "azurerm_storage_account" "storageAccount" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_replication_type = "LRS"
  account_tier             = "Standard"
  tags = {
    Environment = var.tags
  }

}

resource "azurerm_storage_container" "storageContainer" {
  name                 = var.storage_container_name
  storage_account_name = azurerm_storage_account.storageAccount.name
}