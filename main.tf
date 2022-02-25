# Create a subnet within the resource group

# Create a subnet within the resource group

resource "azurerm_subnet" "module_subnet_with_delegation" {
  count                = var.create_delegation == true ? length(var.subnet_address_prefixes) : 0
  name                 = element(var.subnet_name, count.index)
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_address_prefixes[count.index]]
  service_endpoints    = var.service_endpoints

  delegation {
    name = var.delegation_name

    service_delegation {
      name    = var.delegation_service_name
      actions = var.delegation_actions
    }
  }
}


resource "azurerm_subnet" "module_subnet_without_delegation" {
  count                = var.create_delegation != true ? length(var.subnet_address_prefixes) : 0
  name                 = element(var.subnet_name, count.index)
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.subnet_address_prefixes[count.index]]
  service_endpoints    = var.service_endpoints

}

