resource "azurerm_resource_group" "resourceGroup" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    "Environment" = var.tag
  }
}

resource "azurerm_storage_account" "storageAccount" {
  resource_group_name      = var.resource_group_name
  name                     = var.storage_account_name
  location                 = var.location
  account_replication_type = "LRS"
  account_tier             = "Standard"

  tags = {
    "Environment" = var.tag
  }

}

resource "azurerm_storage_container" "storageContainer" {
  name                 = var.storage_account_container
  storage_account_name = azurerm_storage_account.storageAccount.name


}