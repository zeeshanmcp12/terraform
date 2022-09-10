
resource "azurerm_resource_group" "rg-learntf-weu-dev" {
  name     = "rg-learntftf-weu-dev"
  location = "West Europe"
}

data "azurerm_storage_account" "stolearntftfweudev" {
  name                = "stolearntftfweudev"
  resource_group_name = azurerm_resource_group.rg-learntf-weu-dev.name
#   account_tier        = "Standard"
}

output "storage_account_tier" {
  value = data.azurerm_storage_account.stolearntftfweudev.account_tier
}