provider "azurerm" {
  features {}
  //Si es necesario agregar "subscription_id":
  subscription_id = var.subscription_id
}

resource "azurerm_log_analytics_workspace" "my_log_aws_rec" {
  name                = "my-log-aws-dev"
  resource_group_name = var.resource_group
  location            = var.location    
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "my_capp_env_rec" {
  name                = "my-capp-env-dev"
  resource_group_name = var.resource_group
  location            = var.location    
  log_analytics_workspace_id = azurerm_log_analytics_workspace.my_log_aws_rec.id
}

resource "azurerm_container_app" "my_capp_rec" {
  name                         = "my-capp-demo-dev"
  container_app_environment_id = azurerm_container_app_environment.my_capp_env_rec.id
  resource_group_name = var.resource_group
  revision_mode                = "Single"

  registry {
    server               = "registry.hub.docker.com"
    username             = var.my_docker_username
    password_secret_name = "secret-my-docker-pass"
  }

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 80
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = var.container_name
      image  = var.container_image
      cpu    = 0.5
      memory = "1Gi"

      //Environments var de ejemplo (Puede haber varios)
      env {
        name  = "ENV_VALUE"
        value = "value"                        
      }
            
    }
    min_replicas = 0
    max_replicas = 2

  }

  secret { 
    name  = "secret-my-docker-pass" 
    value = var.my_docker_pass
  }


}