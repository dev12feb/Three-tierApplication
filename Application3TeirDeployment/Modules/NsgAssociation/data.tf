data "azurerm_network_interface" "nic" {
  for_each            = var.NsgAssociation
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}



data "azurerm_network_security_group" "nsg" {
  for_each            = var.NsgAssociation
  name                = each.value.nsgname
  resource_group_name = each.value.resource_group_name
}
