Azure Subnet Terraform Module
=====================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage] 

   [opstree_homepage]: https://opstree.github.io/
   [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

- Terraform module which creates Subnet(s) on Azure.

- This project is a part of open source intiative For Azure Terraform Modules.

These types of resources are supported:

* [Subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)

Terraform versions
------------------

Terraform 1.0.8.

Usage
------

```hcl
module "res_group" {
  source                  = "git::https://github.com/OT-terraform-azure-modules/azure_resource_group.git"
  resource_group_name     = ""
  resource_group_location = ""
  tag_map = {
    Name = "azure_rg"
  }
}

module "vnet" {
  source        = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-virtual-network.git"
  rg_name       = module.res_group.resource_group_name
  vnet_name     = ""
  vnet_location = module.res_group.resource_group_location
  address_space = [" "]
  dns_servers   = [" ", " "]

}

module "subnet_module" {
  source                  = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-subnet.git"
  rg_name                 = module.res_group.resource_group_name
  vnet_name               = module.vnet.vnet_name
  subnet_name             = [" ", " "]
  subnet_address_prefixes = [" ", " "]
  delegation_name         = var.delegation_name
  service_name            = var.service_name
  actions                 = var.actions
  service_endpoints       = var.service_endpoints
}
```

Resources
------
| Name | Type |
|------|------|
| [azurerm_subnet.module_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |

Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| subnet_name | Name of the subnet | `list(string)` |  | yes |
| subnet_address_prefixes | Address prefix to associate with the subnet | `list(string)` | | yes |
| vnet_name | Name of Virtual Network in which Subnet would be created | `string` | | yes |
| resource_group_name | The name of the resource group in which to create the virtual network. | `string` |  | Yes |
| delegation_name  | A name for this delegation | `string` |  | yes |
| delegation_service_name |The service to which it is delegated | `string` |  | yes |
| delegation_actions | A list of Actions which should be delegated | `list(string)` | | yes |
| service_endpoints  | The list of Service endpoints to associate with the subnet| `list(string)` |  | yes |

Output
------
| Name | Description |
|------|-------------|
|subnet_id |This variable will give all the details of Subnets |

### Contributors
|  [![Kritarth Pant][kritarth_avatar]][kritarth_homepage]<br/>[Kritarth Pant][kritarth_homepage] |
|---|

[Kritarth_homepage]: https://gitlab.com/kritarthp
[Kritarth_avatar]: https://gitlab.com/uploads/-/system/user/avatar/8613469/avatar.png?width=400

