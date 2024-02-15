variable "QAResourceGroup" {

}

variable "QA_Storage_AccountDetails" {

}

variable "QA_VirtualNetwork" {


}

variable "QA_subnets" {
  default = null
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))

}

variable "QA_PublicIP" {

}

variable "QA_Network_Interface" {

}

variable "QA_networksecurity" {

}

variable "QA_networksecurity_rule" {

}

variable "QA_NsgAssociation" {

}

variable "keyvaultName" {

}

variable "rg_name" {

}

variable "location" {

}

variable "QA_VMs" {

}

variable "QA_SQLServer" {
  
}

variable "QA_TodoDataBase" {
  
}

variable "QA_Backend_address_pool_association" {

}