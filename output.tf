output "subnet_id" {
  value       = azurerm_subnet.module_subnet.*.id
  description = "ID of the subnet"
}

output "subnet_name" {
  value       = azurerm_subnet.module_subnet.*.name
  description = "Name of the subnet"
}

output "subnet_address_prefixes" {
  value       = azurerm_subnet.module_subnet.*.address_prefixes
  description = "Address prefixed of the subnet"
}
