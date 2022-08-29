provider "azurerm" {
  features {}
}

resource "azurerm_api_management" "my_apim" {
  name                = "my-apim-demo-dev"
  location            = var.location
  resource_group_name = var.resource_group
  publisher_name      = "My Demo"
  publisher_email     = "jaraucovillar@outlook.com"

  sku_name = "Developer_1"
}