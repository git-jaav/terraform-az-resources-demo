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

variable "subscription_id" {
  description = "subscription id"
  //default = "value"
}

variable "container_name" {
  description = "container name "
  //default = "value"
}

variable "container_image" {
  description = "container image "
  //default = "value"
}

variable "my_docker_username" {
  description = "docker hub user name"
  default = "dockerjaav"
}

variable "my_docker_pass" {
  description = "docker hub password"
  //default = "value"
}

variable "mongodb_uri" {
  description = "mongodb uri connection"
  //default = "value"
}

variable "mongodb_namedb" {
  description = "mongodb name database"
  //default = "value"
}