resource "azurerm_linux_virtual_machine" "qdrant" {
  name                = "${var.environment}-qdrant-vm"
  resource_group_name = var.resource_group_name
  location            = var.region
  size                = var.vm_size

  admin_username      = var.admin_username

  network_interface_ids = var.network_interface_ids

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}