resource "azurerm_linux_virtual_machine" "vm" {
  name                = "wordpress-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B2s"

  admin_username = "adminuser"
  admin_password = "Adm1n.passw0rd"

  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("id_rsa.pub")


  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  custom_data = filebase64("cloud-init.yaml")

  tags = {
    environment = "dev"
  }
}