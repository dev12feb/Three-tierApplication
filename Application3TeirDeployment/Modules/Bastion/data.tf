data "azurerm_subnet" "subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "ToDoAppVnetsDevSecOPs"
  resource_group_name  = "DevSecOpsRG1Divyansh"
}

data "azurerm_public_ip" "publicIP" {
  name                = "Bastion_IP"
  resource_group_name = "DevSecOpsRG1Divyansh"
}