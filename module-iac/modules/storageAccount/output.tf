output "name" {
  value = azurerm_storage_account.storageAccount.name
}

output "access_key" {
  value = azurerm_storage_account.storageAccount.primary_access_key

}