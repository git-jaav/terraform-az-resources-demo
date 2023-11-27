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

variable "tags" {
  type = map(string)

  default = {
    source = "terraform"
  }
}