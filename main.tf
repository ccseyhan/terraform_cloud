resource "azurerm_resource_group" "rg" {
  name = "cemal"
  location = "West Europe"
}


resource "azurerm_network_interface" "nic1" {
  name = "vm1874"
  resource_group_name = "cemal"
  location = var.location
    ip_configuration {
        name                          = "ipconfig1"
        public_ip_address_id          = "/subscriptions/3fbc91bd-d532-48d4-8bc8-b36307604c0f/resourceGroups/cemal/providers/Microsoft.Network/publicIPAddresses/vm1-ip"
        subnet_id                     = "/subscriptions/3fbc91bd-d532-48d4-8bc8-b36307604c0f/resourceGroups/cemal/providers/Microsoft.Network/virtualNetworks/cemal-vnet/subnets/default"
        private_ip_address_allocation =  "Dynamic"
        }
}