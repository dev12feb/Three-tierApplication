data "azurerm_public_ip" "publicIP" {

  name                = "Loadbalncer_IP"
  resource_group_name = "DevSecOpsRG1Divyansh"

}

data "azurerm_network_interface" "NIC" {
  for_each            = var.backend_address_pool_association
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name

}

