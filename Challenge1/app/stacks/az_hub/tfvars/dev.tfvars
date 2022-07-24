rg_name = <%= output('az_rg.dt_resource_group_name', mock: 'dt-dev-rg') %>
rg_location = <%= output('az_rg.dt_resource_group_location', mock: 'westeurope') %>

# Network variables declaration
vnet_name          = "dt_dev_vnet"
vnet_location      = "westeurope"
vnet_address_space = ["10.2.0.0/16", "10.3.0.0/16"]


# VNET Peering variables
hub_remote_virtual_network_id = "/subscriptions/cafadfa0-68e0-44e6-a8b1-8a36cee096fb/resourceGroups/rg-amsaw_preprd-networking/providers/Microsoft.Network/virtualNetworks/vnet-amsaw_preprd-hub"
spoke_hub_link_name           = "dt_dev_vnet-spoke-to-vnet-amsaw_preprd-hub"
hub_spoke_link_name           = "vnet-amsaw_preprd-hub-to-dt_dev_vnet-spoke"
hub_virtual_network_rg        = "rg-amsaw_preprd-networking"
hub_virtual_network_name      = "vnet-amsaw_preprd-hub"

