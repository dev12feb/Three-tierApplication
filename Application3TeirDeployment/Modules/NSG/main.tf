resource "azurerm_network_security_group" "NSG" {
  for_each            = var.networksecurity
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name


  dynamic "security_rule" {
    for_each = var.rule != null ? var.rule : {}
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

  }

}
