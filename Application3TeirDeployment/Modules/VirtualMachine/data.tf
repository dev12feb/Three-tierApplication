data "azurerm_key_vault" "keyvault" {
  name                = "divyansh986"
  resource_group_name = "DevSecOpsRG1Divyansh"
}

/* data "azurerm_key_vault_secrets" "secrets" {

  key_vault_id = data.azurerm_key_vault.keyvault.id

}

data "azurerm_key_vault_secret" "secret" {
  for_each     = toset(data.azurerm_key_vault_secrets.secrets.names)
  name         = each.key
  key_vault_id = data.azurerm_key_vault.keyvault.id
} */

data "azurerm_key_vault_secret" "username" {
  name = "username"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "password" {
  name = "password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_network_interface" "networkinterface" {
  for_each            = var.VMS
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name

}


