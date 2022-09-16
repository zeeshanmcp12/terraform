locals {
  resource_name        = "${var.project}-${var.environment}"
  storage_account_name = "${var.project}${var.environment}"
}

module "rg" {
  source        = "./modules/rg"
  resource_name = local.resource_name
  location      = var.location
  tags = {
    Environment = var.tags
  }
}

module "storageAccount" {
  source        = "./modules/storageAccount"
  resource_name = local.storage_account_name
  rg_name       = module.rg.name
  location      = var.location
  tags = {
    Environment = var.tags
  }
  depends_on = [
    module.rg
  ]
}