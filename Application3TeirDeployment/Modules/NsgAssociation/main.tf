resource "azurerm_network_interface_security_group_association" "example" {
  for_each = var.NsgAssociation
  network_interface_id      = data.azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}