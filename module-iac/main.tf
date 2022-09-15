module "rg" {
  source              = "./modules/rg"
  resource_group_name = var.resource_group_name
  location            = var.location
  tag = {
    "environment" = var.tag
  }

}