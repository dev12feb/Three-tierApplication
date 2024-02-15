module "resource_groupe" {
  source = "../../Modules/ResourceGroup"
  rgs    = var.DevlopmentResourceGroup
}

module "StorsgeAccount_Container" {
  depends_on             = [module.resource_groupe]
  source                 = "../../Modules/StorageAccount"
  Storage_AccountDetails = var.Devlopment_Storage_AccountDetails
}

module "virtual_network" {
  depends_on = [module.resource_groupe]
  source     = "../../Modules/VirtualNetwork"
  todovnet   = var.Devlopment_VirtualNetwork

}

module "Subnets" {
  depends_on = [module.virtual_network]
  source     = "../../Modules/SubNet"
  subnets    = var.Devlopment_subnets
}

module "publicIp" {
  depends_on = [module.resource_groupe]
  source     = "../../Modules/PublicIP"
  PublicIP   = var.Devlopment_PublicIP

}

module "Bastion" {
  depends_on = [module.publicIp, module.Subnets]
  source     = "../../Modules/Bastion"


}

module "NIC" {
  depends_on       = [module.Subnets]
  source           = "../../Modules/NIC"
  networkInterface = var.Devlopment_Network_Interface

}

module "NSG" {
  depends_on      = [module.NIC]
  source          = "../../Modules/NSG"
  networksecurity = var.Development_networksecurity
  rule            = var.Development_networksecurity_rule

}

module "NSGAssociation" {
  depends_on     = [module.NSG]
  source         = "../../Modules/NsgAssociation"
  NsgAssociation = var.Development_NsgAssociation

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
  VMS        = var.Devlopment_VMs

}

module "SQLServer" {
  source    = "../../Modules/SQLServer"
  sqlserver = var.Devlopment_SQLServer

}

module "SQLDataBase" {
  source       = "../../Modules/SQLDataBase"
  todoDataBase = var.Devlopment_TodoDataBase

}

module "LoadBalancer" {
  depends_on                       = [module.NIC, module.publicIp, module.resource_groupe]
  source                           = "../../Modules/LoadBalancer"
  backend_address_pool_association = var.Development_Backend_address_pool_association

}

