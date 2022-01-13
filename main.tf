# Create a subnet within the resource group

resource "azurerm_subnet" "module_subnet" {
  count                = length(var.subnet_address_prefixes)
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
