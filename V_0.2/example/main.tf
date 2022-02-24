provider "azurerm" {
  features {}
}

module "res_group" {
  source                  = "git::https://github.com/OT-terraform-azure-modules/azure_resource_group.git"
  resource_group_name     = "test-rg"
  resource_group_location = "West Europe"
  lock_level_value        = ""
  tag_map = {
    Name = "AzureRG"
  }
}
module "vnet" {
  source                      = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-virtual-network.git"
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
  subnet_address_prefixes = ["10.0.0.0/24", "10.0.1.0/24"]
  delegation_name         = "Delegation"
  delegation_service_name = "Microsoft.ContainerInstance/containerGroups"
  service_endpoints       = ["Microsoft.AzureActiveDirectory", "Microsoft.AzureCosmosDB"]
  delegation_actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
}
