# Network variables definition
variable "vnet_name" {
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
}

variable "rg_location" {
  type        = string
  description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "rg_name" {
  description = "(Required) The name of the resource group in which to create the virtual network"
  type        = string
}


variable "hub_virtual_network_rg" {
  description = "(Required) The name of the hub resource group in which to create the virtual network peering."
  type        = string
}

variable "hub_virtual_network_name" {
 description = "(Required) The name of the hub virtual network. Changing this forces a new resource to be created."
 type        = string
}

variable "spoke_hub_link_name" {
  description = "(Required) The name of the spoke to hub virtual network peering. Changing this forces a new resource to be created."
  type        = string
}

variable "hub_spoke_link_name" {
  type    = string
  default = "(Required) The name of the hub to spoke virtual network peering. Changing this forces a new resource to be created."
}

