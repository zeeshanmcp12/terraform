resource "azurerm_resource_group" "resourceGroup" {
  name = "rg-${var.resource_name}"
  location = var.location
  tags     = var.tags

}