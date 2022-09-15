resource "azurerm_resource_group" "resourceGroup" {
  name     = var.resource_group_name
  id       = "/subscriptions/7db4b5cd-3b47-42f5-b7da-a973f1a85739/resourceGroups/learntfrg"
  location = var.location
  tags     = var.tags

}