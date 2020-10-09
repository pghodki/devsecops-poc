provider "azurerm" {
    version     = "2.28.0"
    environment = "usgovernment"
    features {}
}

terraform {
  backend "azurerm" {
      environment = "usgovernment"
  }
}

locals {
  resource_location = "usgovarizona"
}

data "azurerm_resource_group" "sarg" {
  name = "stgacctrg"
}

module "storage_account" {
  source    = "../modules/storageaccount"

  saname    = var.saname
  rgname    = azurerm_resource_group.sarg.name
  location  = azurerm_resource_group.sarg.location
}