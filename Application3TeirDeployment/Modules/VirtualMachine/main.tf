resource "azurerm_linux_virtual_machine" "example" {
  for_each              = var.VMS
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = data.azurerm_key_vault_secret.username.value
  admin_password        = data.azurerm_key_vault_secret.password.value
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.networkinterface[each.key].id]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
