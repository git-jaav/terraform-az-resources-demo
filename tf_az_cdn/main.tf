provider "azurerm" {
  features {}
}

resource "azurerm_cdn_profile" "demo" {
  name                = "my-cdn-pf-demo-dev"
  location            = var.location
  resource_group_name = var.resource_group  
  sku                 = "Premium_Verizon"
  //sku                 = "Standard_Verizon"
}

// no es posible a nivel de CDN premium crear desde acá:
/*resource "azurerm_cdn_endpoint" "demo" {
  name                = "my-cdn-ep-demo-dev"
  profile_name        = azurerm_cdn_profile.demo.name
  location            = var.location
  resource_group_name = var.resource_group

  origin {
    name      = "cal-demo-dev"
    host_name = "mystorageaccountdemodev.blob.core.windows.net"
  }
}*/