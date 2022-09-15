resource "azurerm_storage_account" "storageAccount" {
  name                     = var.location
  account_replication_type = "LRS"
  account_tier             = "Standard"
  resource_group_name      = var.resource_group_name
  location                 = var.location

}