resource "azurerm_network_interface" "networkInterface" {
  for_each            = var.networkInterface
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = data.azurerm_subnet.subnetID[each.key].id
    private_ip_address_allocation = "Dynamic"
      }
}

