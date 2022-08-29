provider "azurerm" {
  features {}
}

resource "azurerm_service_plan" "my_demo" {
  name                = "my-splan-demo-dev"
  resource_group_name = var.resource_group
  location            = var.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "my_demo" {
  name                = "my-webapp-demo-dev"
  resource_group_name = var.resource_group
  location            = var.location
  service_plan_id     = azurerm_service_plan.my_demo.id

  site_config {
    always_on         = false
  }
}