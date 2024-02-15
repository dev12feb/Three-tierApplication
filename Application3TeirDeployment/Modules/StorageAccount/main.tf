resource "azurerm_storage_account" "storage_account" {
  for_each                 = var.Storage_AccountDetails
  name                     = each.value.storage_acc_name
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    enviorenmt = each.value.tags
  }

}

resource "azurerm_storage_container" "storageContainer" {
  depends_on           = [azurerm_storage_account.storage_account]
  name                 = "todocontainer"
  storage_account_name = "toodoapps"


} 