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
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "aztech_rg" {
  name     = "aztechchallenge-resources"
  location = "East US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "aztech_vnet" {
  name                = "aztech-network"
  resource_group_name = azurerm_resource_group.aztech_rg.name
  location            = azurerm_resource_group.aztech_rg.location
  address_space       = ["10.0.0.0/16"]
}

# Create subnets within the vnet
resource "azurerm_subnet" "sub1" {
    name                 = "subnet1"
    virtual_network_name = azurerm_virtual_network.aztech_vnet.name
    resource_group_name  = azurerm_resource_group.aztech_rg.name
    address_prefixes     = ["10.0.0.0/24"]
  
}

resource "azurerm_subnet" "sub2" {
    name                 = "subnet2"
    virtual_network_name = azurerm_virtual_network.aztech_vnet.name
    resource_group_name  = azurerm_resource_group.aztech_rg.name
    address_prefixes     = ["10.0.1.0/24"]
  
}

resource "azurerm_subnet" "sub3" {
    name                 = "subnet3"
    virtual_network_name = azurerm_virtual_network.aztech_vnet.name
    resource_group_name  = azurerm_resource_group.aztech_rg.name
    address_prefixes     = ["10.0.2.0/24"]
  
}

resource "azurerm_subnet" "sub4" {
    name                 = "subnet4"
    virtual_network_name = azurerm_virtual_network.aztech_vnet.name
    resource_group_name  = azurerm_resource_group.aztech_rg.name
    address_prefixes     = ["10.0.3.0/24"]
  
}

# Create availability sets
resource "azurerm_availability_set" "aztech_aset" {
  name                = "AzTech-aset"
  location            = azurerm_resource_group.aztech_rg.location
  resource_group_name = azurerm_resource_group.aztech_rg.name

  tags = {
    environment = "Azure Tech Challenge"
  }
}

