resource "azurerm_public_ip" "publicIP" {
  for_each            = var.PublicIP
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = "switzerland north"
  allocation_method   = "Static"
  sku                 = each.value.sku

}
