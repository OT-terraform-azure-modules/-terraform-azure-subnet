variable "resource_group_name" {
  description = "The variable for resource group name"
  type        = string
}

variable "subnet_name" {
  description = "The variable for subnet name"
  type        = list(string)
}

variable "delegation_name" {
 description = "The variable for delegation name"
 type        = string
 default     = ""
}

variable "delegation_actions" {
 description = "The variable for actions for service delegation"
 type        = list (string)
  default    =  [""]
  
}

variable "delegation_service_name" {
  description = "The variable for service name for delegation"
  type        = string
   default     = ""
} 

variable "vnet_name" {
  description = "The CIDR block for the vnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The CIDR block for the vnet"
  type        = list(string)
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet"
  type        = list(string)
}

variable "create_delegation" { 
  description = "create_delegation"
  type        = bool
  default     = false
}

