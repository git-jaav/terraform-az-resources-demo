provider "azurerm" {
  features {}
}

resource "azurerm_service_plan" "my_demo" {
  name                = "my-splan-demo-dev"
  resource_group_name = var.resource_group
  location            = var.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "my_demo" {
  name                = "my-webapp-demo-dev"
  resource_group_name = var.resource_group
  location            = var.location
  service_plan_id     = azurerm_service_plan.my_demo.id

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false

    /*
    # Settings for private Container Registires  
    DOCKER_REGISTRY_SERVER_URL      = ""
    DOCKER_REGISTRY_SERVER_USERNAME = ""
    DOCKER_REGISTRY_SERVER_PASSWORD = ""
    */
  }
  site_config {
    //linux_fx_version = "DOCKER|appsvcsample/static-site:latest"
    // Try after create, the config:
    //az webapp config set --name <webapp-name> --resource-group <resource-group-name> --linux-fx-version "DOCKER|<yourACRRegistryName.azurecr.io/yourimage:yourtag>"
    always_on        = "true"
  }
  identity {
    type = "SystemAssigned"
  }  
}