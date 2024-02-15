variable "ProductionResourceGroup" {

}

variable "Production_Storage_AccountDetails" {

}

variable "Production_VirtualNetwork" {


}

variable "Production_subnets" {
  default = null
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))

}

variable "Production_PublicIP" {

}

variable "Production_Network_Interface" {

}

variable "Production_networksecurity" {

}

variable "Production_networksecurity_rule" {

}

variable "Production_NsgAssociation" {

}

variable "keyvaultName" {

}

variable "rg_name" {

}

variable "location" {

}

variable "Production_VMs" {

}

variable "Production_SQLServer" {
  
}

variable "Production_TodoDataBase" {
  
}

variable "Production_Backend_address_pool_association" {

}