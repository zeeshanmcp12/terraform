locals {
  project            = var.project
  location           = var.location
  environment        = var.env
  resourceGroupName  = "${var.project}-${var.location}-${var.environment}"
  storageAccountName = "${var.project}${var.environment}sto"
  tags = {
    Project = var.tag
  }
}

module "rg" {
  source   = "./modules/rg"
  name     = local.resourceGroupName
  location = local.location
  tags     = local.tags

}

module "storageAccount" {
  source   = "./modules/storageAccount"
  name     = local.storageAccountName
  location = local.location
  tags     = local.tags
}