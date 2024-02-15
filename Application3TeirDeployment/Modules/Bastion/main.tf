resource "azurerm_bastion_host" "example" {
  name                = "bastion"
  location            = "switzerland north"
  resource_group_name = "DevSecOpsRG1Divyansh"

  ip_configuration {
    name                 = "bastionconfiguration"
    subnet_id            = data.azurerm_subnet.subnet.id
    public_ip_address_id = data.azurerm_public_ip.publicIP.id
  }
}