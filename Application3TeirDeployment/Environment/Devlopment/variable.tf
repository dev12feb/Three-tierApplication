variable "DevlopmentResourceGroup" {

}

variable "Devlopment_Storage_AccountDetails" {

}

variable "Devlopment_VirtualNetwork" {


}

variable "Devlopment_subnets" {
  default = null
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))

}

variable "Devlopment_PublicIP" {

}

variable "Devlopment_Network_Interface" {

}

variable "Development_networksecurity" {

}

variable "Development_networksecurity_rule" {

}

variable "Development_NsgAssociation" {

}

variable "keyvaultName" {

}

variable "rg_name" {

}

variable "location" {

}

variable "Devlopment_VMs" {

}

variable "Devlopment_SQLServer" {

}

variable "Devlopment_TodoDataBase" {

}

variable "Development_Backend_address_pool_association" {

}
