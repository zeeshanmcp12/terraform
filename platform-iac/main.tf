resource "azurerm_resource_group" "resourceGroup" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment = var.tag
  }

}

resource "azurerm_storage_account" "storageAccount" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_replication_type = "LRS"

  tags = {
    Environment = var.tag
  }

}

resource "azurerm_app_service_plan" "appServicePlan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = {
    Environment = var.tag
  }

  sku {
    tier = "Standard"
    size = "S1"
  }

}

resource "azurerm_function_app" "functionApp" {
  name                       = var.func_app_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  storage_account_name       = var.storage_account_name
  app_service_plan_id        = azurerm_app_service_plan.appServicePlan.id
  storage_account_access_key = azurerm_storage_account.storageAccount.primary_access_key

  tags = {
    Environment = var.tag
  }

}