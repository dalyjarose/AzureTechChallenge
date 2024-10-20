resource "azurerm_linux_virtual_machine" "linuxvm" {
  count                 = 2
  name                  = "${var.prefix}vm${count.index + 1}"
  location              = azurerm_resource_group.aztech_rg.location
  resource_group_name   = azurerm_resource_group.aztech_rg.name
  network_interface_ids = [azurerm_network_interface.network_interface.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    disk_size_gb         = 250
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-lvm-gen2"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = "azureuser"
  disable_password_authentication = true

}
