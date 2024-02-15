resource "azurerm_lb" "loadBalancer" {
  name                = "ToDoLoadBalancer"
  location            = "switzerland north"
  resource_group_name = "DevSecOpsRG1Divyansh"
  sku                 = "Standard"


  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.publicIP.id
  }
}

resource "azurerm_lb_backend_address_pool" "LbBackendAddPool" {
  loadbalancer_id = azurerm_lb.loadBalancer.id
  name            = "BackEndAddressPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "name" {
  for_each                = var.backend_address_pool_association
  backend_address_pool_id = azurerm_lb_backend_address_pool.LbBackendAddPool.id
  ip_configuration_name   = each.value.ip_configuration_name
  network_interface_id    = data.azurerm_network_interface.NIC[each.key].id

}

resource "azurerm_lb_probe" "healtProbe" {
  loadbalancer_id = azurerm_lb.loadBalancer.id
  name            = "frontendProbe"
  port            = 80
}

resource "azurerm_lb_rule" "LbRule" {
  loadbalancer_id                = azurerm_lb.loadBalancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.LbBackendAddPool.id]
  probe_id                       = azurerm_lb_probe.healtProbe.id
}


