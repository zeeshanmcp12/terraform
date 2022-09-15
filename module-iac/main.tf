module "rg" {
  source              = "./modules/rg"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags = {
    Environment = var.tags
  }

}

module "storageAccount" {
  source              = "./modules/storageAccount"
  name                = var.storageAccount
  resource_group_name = var.resource_group_name
  location            = var.location
  tags = {
    Environment = var.tags
  }
}

# resource "azurerm_storage_account" "storageAccount" {
#   name = var.location
#   account_replication_type = "LRS"
#   account_tier = "Standard"
#   resource_group_name = module.rg.name
#   location = var.location

# }