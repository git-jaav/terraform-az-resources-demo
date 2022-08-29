variable "suffix" {
  description = "sufijo para recursos"
  default = "demo-dev"
}

variable "location" {
  description = "Location"
  default = "East US"
}

variable "resource_group" {
  description = "resource group"
  default = "rg-demo-dev"
}

variable "virtual_network_name" {
  description = "Virtual network name"
  default     = "vnet-demo-dev"
}

variable "virtual_network_address_prefix" {
  description = "VNET address prefix"
  default     = "10.224.0.0/16"
}

variable "aks_subnet_name" {
  description = "Subnet Name."
  default     = "aks-subnet"
}

variable "aks_subnet_address_prefix" {
  description = "Subnet address prefix."
  default     = "10.224.0.0/24"
}

variable "aks_service_principal_app_id" {
  description = "Application ID/Client ID  of the service principal. Used by AKS to manage AKS related resources on Azure like vms, subnets."
  default     = "5a61cf1b-d2f8-4123-ac27-a101165e5132"
}

variable "aks_service_principal_client_secret" {
  description = "Secret of the service principal. Used by AKS to manage Azure."
  default     = "A4b8Q~s-Ep3Dr6JTMD_35t-IHPYL0LG9ZAynacyE"
}

variable "aks_enable_rbac" {
  description = "Enable RBAC on the AKS cluster. Defaults to false."
  default     = "false"
}

variable "tags" {
  type = map(string)

  default = {
    source = "terraform"
  }
}