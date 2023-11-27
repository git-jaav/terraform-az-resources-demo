provider "azurerm" {
  features {}
}

resource "azurerm_mssql_server" "my_demo" {
  name                = "my-mssql-server-${var.suffix}"  
  resource_group_name = var.resource_group
  location            = var.location  
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_login_pw # reemplazar por variables

  tags = {
    environment = "dev"
  }
}

resource "azurerm_mssql_database" "my_demo" {
  name                = "my-mssql-db-${var.suffix}"    
  server_id           = azurerm_mssql_server.my_demo.id  
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb         = 1
  sku_name       = "S0"  # Replace with the desired DTU level, e.g., "S0", "S1", etc.
  zone_redundant = false  
  //service_objective   = "S0" 

  tags = {
    environment = "dev"
  }
}