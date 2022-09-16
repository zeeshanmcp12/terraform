locals {
  resource_name        = "${var.project}-${var.environment}"
  storage_account_name = "${var.project}${var.environment}"
}

module "rg" {
  source        = "./modules/rg"
  resource_name = var.resource_group_name
  location      = var.location
  tags = {
    Environment = var.tags
  }
}

module "storageAccount" {
  source        = "./modules/storageAccount"
  resource_name = local.resource_name
  rg_name       = module.rg.name
  location      = var.location
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