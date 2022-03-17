provider "azurerm" {
  features {}
}

module "res_group" {
  source                  = "git::git@gitlab.com:ot-azure/terraform/rg.git"
  resource_group_name     = "test-rg"
  resource_group_location = "West Europe"
  lock_level_value        = ""
  tag_map = {
    Name = "AzureRG"
  }
}
module "vnet" {
  source                      = "git::git@gitlab.com:ot-azure/terraform/virtual_network.git"
  resource_group_name         = module.res_group.resource_group_name
  resource_group_location     = module.res_group.resource_group_location
  address_space               = ["10.0.0.0/16"]
  vnet_name                   = "kritarth-vnet"
  dns_servers                 = ["10.0.0.4", "10.0.0.5"]
  create_ddos_protection_plan = true
  tag_map = {
    Owner = "kritarth"
  }
}
module "subnet_module" {
   source                  = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-subnet.git"
   resource_group_name     = module.res_group.resource_group_name
   vnet_name               = module.vnet.vnet_name
   subnet_name             = ["opensource1 ", "opensource2 "]
   subnet_address_prefixes = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
   service_endpoints       = ["Microsoft.AzureActiveDirectory", "Microsoft.AzureCosmosDB"]
   delegation_name    = { 
    delegation-subnet = [
      {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    ]
  }
}




