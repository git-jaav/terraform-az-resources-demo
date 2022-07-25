provider "azurerm" {
  features {}
}

data "azurerm_subnet" "kubesubnet" {
  name                 = var.aks_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group
  depends_on           = [azurerm_virtual_network.my_vnet]
}

resource "azurerm_virtual_network" "my_vnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group
  address_space       =  [var.virtual_network_address_prefix]

  subnet {
    name           = var.aks_subnet_name
    address_prefix = var.aks_subnet_address_prefix
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "my-kube-${var.suffix}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  dns_prefix          = "my-kube-${var.suffix}"

  kubernetes_version = "1.21.9"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"    
    vnet_subnet_id  =  data.azurerm_subnet.kubesubnet.id
  }

  service_principal {
    client_id     = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }


  /*identity {
    type = "SystemAssigned"
  }*/

  /*role_based_access_control {
    enabled = var.aks_enable_rbac
  }*/

  depends_on = [azurerm_virtual_network.my_vnet]
  tags       = var.tags

}