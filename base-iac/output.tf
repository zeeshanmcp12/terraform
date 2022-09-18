output "rg_name" {
  value = azurerm_resource_group.rg.name
}

output "rg_id" {
  value = azurerm_resource_group.rg.id
}

output "sto_id" {
  value = azurerm_storage_account.storageAccount.id
}

output "sto_access_key" {
  value = azurerm_storage_account.storageAccount.primary_access_key
  sensitive = true
}

