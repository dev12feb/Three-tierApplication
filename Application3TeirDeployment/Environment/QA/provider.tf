terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.84.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "DevSecOpsRG1Divyansh"
    storage_account_name = "toodoapps"
    container_name       = "todocontainer"
    key                  = "QAEnvironment.tfstate"
  } 
}

provider "azurerm" {
  features {}
}