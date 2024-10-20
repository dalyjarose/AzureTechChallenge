# Create a virtual network within the resource group
resource "azurerm_virtual_network" "aztech_vnet" {
  name                = "${var.prefix}-network"
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

resource "azurerm_network_interface" "network_interface" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.aztech_rg.location
  resource_group_name = azurerm_resource_group.aztech_rg.name

  ip_configuration {
    name                          = "ipconfiguration1"
    subnet_id                     = azurerm_subnet.sub1.id
    private_ip_address_allocation = "Dynamic"
  }
  ip_configuration {
    name                          = "ipconfiguration3"
    subnet_id                     = azurerm_subnet.sub3.id
    private_ip_address_allocation = "Dynamic"
  }
}