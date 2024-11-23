resource "azurerm_linux_virtual_machine" "qdrant" {
  name                = "${var.environment}-qdrant-vm"
  resource_group_name = var.resource_group_name
  location            = var.region
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = var.network_interface_ids

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

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = var.admin_username
      password = var.admin_password
      host     = azurerm_linux_virtual_machine.qdrant.public_ip_address
    }

    inline = [
      "sudo apt update",
      "sudo apt install -y ansible",
      "ansible-playbook -i hosts microk8s.yml",
    ]
  }
}