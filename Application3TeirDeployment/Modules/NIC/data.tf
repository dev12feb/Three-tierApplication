data "azurerm_public_ip" "publicIPID" {
  resource_group_name = "DevSecOpsRG1Divyansh"
  name                = "Frontend_IP"
}

data "azurerm_subnet" "subnetID" {
  for_each             = var.networkInterface
  name                 = each.value.ip_configuration.subnetName
  resource_group_name  = "DevSecOpsRG1Divyansh"
  virtual_network_name = "ToDoAppVnetsDevSecOPs"
}
