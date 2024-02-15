resource "azurerm_sql_database" "todoDataBase" {
    for_each = var.todoDataBase
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  server_name         = each.value.server_name

  
}