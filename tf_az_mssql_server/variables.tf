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

variable "admin_login" {
  description = "administrator_login default"
  default = "myDemoUser"
}

variable "admin_login_pw" {
  description = " administrator_login_password default"
  default = "MyP@ssword1234"
}