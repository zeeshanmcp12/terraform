resource "azurerm_storage_account" "storageAccount" {
  name                     = "sto${var.resource_name}"
  account_replication_type = "LRS"
  account_tier             = "Standard"
  resource_group_name      = var.rg_name
  location                 = var.location
  tags                     = var.tags

}