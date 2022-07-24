
# Azurerm provider for Hub
provider "azurerm" {
  features {}
  subscription_id = "cafadfa0-68e0-44e6-a8b1-8a36cee096fb" #preprod hub scription_id
  alias = "hub_provider"
}


data "azurerm_virtual_network" "hubvnet" {
  name                = var.hub_virtual_network_name
  resource_group_name = var.hub_virtual_network_rg
  provider            = azurerm.hub_provider
}

# Create vnet peering for spoke to hub.
resource "azurerm_virtual_network_peering" "peering_spoke_hub" {
  name                         = var.spoke_hub_link_name
  resource_group_name          = var.rg_name
  virtual_network_name         = module.tf_azure_virtual_network.name
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  remote_virtual_network_id    = data.azurerm_virtual_network.hubvnet.id #hub virtual network ID
}

# # Create vnet peering for hub to spoke.
resource "azurerm_virtual_network_peering" "peering_hub_spoke" {
  name                         = var.hub_spoke_link_name
  resource_group_name          = var.hub_virtual_network_rg
  virtual_network_name         = var.hub_virtual_network_name
  remote_virtual_network_id    = module.tf_azure_virtual_network.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  provider                     = azurerm.hub_provider
}
