provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "demo" {
  name                     = "mystorageaccountdemodev"

  location            = var.location
  resource_group_name = var.resource_group

  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier = "Hot"

  tags = {
    environment = "dev"
  }
}