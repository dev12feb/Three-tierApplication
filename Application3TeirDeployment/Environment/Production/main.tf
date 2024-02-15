module "resource_groupe" {
  source = "../../Modules/ResourceGroup"
  rgs    = var.ProductionResourceGroup
}

module "StorsgeAccount_Container" {
  depends_on             = [module.resource_groupe]
  source                 = "../../Modules/StorageAccount"
  Storage_AccountDetails = var.Production_Storage_AccountDetails
}

module "virtual_network" {
  depends_on = [module.resource_groupe]
  source     = "../../Modules/VirtualNetwork"
  todovnet   = var.Production_VirtualNetwork

}

module "Subnets" {
  depends_on = [module.virtual_network]
  source     = "../../Modules/SubNet"
  subnets    = var.Production_subnets
}

module "publicIp" {
  depends_on = [module.resource_groupe]
  source     = "../../Modules/PublicIP"
  PublicIP   = var.Production_PublicIP

}

module "Bastion" {
  depends_on = [module.publicIp, module.Subnets]
  source     = "../../Modules/Bastion"


}

module "NIC" {
  depends_on       = [module.Subnets]
  source           = "../../Modules/NIC"
  networkInterface = var.Production_Network_Interface

}

module "NSG" {
  depends_on      = [module.NIC]
  source          = "../../Modules/NSG"
  networksecurity = var.Production_networksecurity
  rule            = var.Production_networksecurity_rule

}

module "NSGAssociation" {
  depends_on     = [module.NSG]
  source         = "../../Modules/NsgAssociation"
  NsgAssociation = var.Production_NsgAssociation

}


module "KeyVault" {
  source       = "../../Modules/KeyVault"
  rg_name      = var.rg_name
  location     = var.location
  keyvaultName = var.keyvaultName

}

module "VirtulaMachine" {
  depends_on = [module.NIC, module.KeyVault]
  source     = "../../Modules/VirtualMachine"
  VMS        = var.Production_VMs

}

module "SQLServer" {
  depends_on = [module.resource_groupe]
  source     = "../../Modules/SQLServer"
  sqlserver  = var.Production_SQLServer

}

module "SQLDataBase" {
  depends_on   = [module.SQLServer]
  source       = "../../Modules/SQLDataBase"
  todoDataBase = var.Production_TodoDataBase

}

module "LoadBalancer" {
  depends_on                       = [module.NIC, module.publicIp, module.resource_groupe]
  source                           = "../../Modules/LoadBalancer"
  backend_address_pool_association = var.Production_Backend_address_pool_association

}
