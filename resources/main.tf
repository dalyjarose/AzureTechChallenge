# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
}

variable "prefix" {
  default = "aztech"
}

# Create a resource group
resource "azurerm_resource_group" "aztech_rg" {
  name     = "${var.prefix}challenge-resources"
  location = "East US"
}



# Create availability sets
resource "azurerm_availability_set" "aztech_aset" {
  name                = "${var.prefix}-aset"
  location            = azurerm_resource_group.aztech_rg.location
  resource_group_name = azurerm_resource_group.aztech_rg.name

  tags = {
    environment = "Azure Tech Challenge"
  }
}
