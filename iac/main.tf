resource "azurerm_resource_group" "resourceGroup"{
    name = var.resource_group_name
    location = var.location
    tags = {
      "Environment" = var.tag
    }
}

resource "azurerm_storage_account" "storageAccount" {
    name = var.storage_account_name
    resource_group_name = azurerm_resource_group.resourceGroup.name
    account_tier = "Standard"
    location = var.location
    account_replication_type = "LRS" 

    tags = {
      "Environment" = var.tag
    }
}

resource "azurerm_storage_container" "storageContainer" {
  name = var.storage_container_name
  storage_account_name = azurerm_storage_account.storageAccount.name
}


resource "azurerm_app_service_plan" "appServicePlan" {
  name                = var.app_service_plan
  location            = azurerm_resource_group.resourceGroup.location
  resource_group_name = azurerm_resource_group.resourceGroup.name

  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = {
      "Environment" = var.tag
    }
}

resource "azurerm_function_app" "functionApp" {
  name                       = var.func_app_name
  location                   = azurerm_resource_group.resourceGroup.location
  resource_group_name        = azurerm_resource_group.resourceGroup.name
  app_service_plan_id        = azurerm_app_service_plan.appServicePlan.id
  storage_account_name       = azurerm_storage_account.storageAccount.name
  storage_account_access_key = azurerm_storage_account.storageAccount.primary_access_key

  tags = {
      "Environment" = var.tag
    }
}