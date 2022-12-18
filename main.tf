resource "azurerm_resource_group" "rg" {
  name = "cemal"
  location = "West Europe"
}


resource "azurerm_public_ip" "pip1" {
  name                = "vm1-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Static"
  sku = "Standard"
}


resource "azurerm_network_interface" "nic1" {
  name = "vm1874"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
    ip_configuration {
        name                          = "ipconfig1"
        public_ip_address_id          = azurerm_public_ip.pip1.id
        subnet_id                     = "/subscriptions/3fbc91bd-d532-48d4-8bc8-b36307604c0f/resourceGroups/cemal/providers/Microsoft.Network/virtualNetworks/cemal-vnet/subnets/default"
        private_ip_address_allocation =  "Dynamic"
        }
}



resource "azurerm_network_security_group" "nsg1" {
  name                = "vm1-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
               access                                     = "Allow"
               description                                = ""
               destination_address_prefix                 = "*"
               destination_address_prefixes               = []
               destination_application_security_group_ids = []
               destination_port_range                     = "22"
               destination_port_ranges                    = []
               direction                                  = "Inbound"
               name                                       = "SSH"
               priority                                   = 300
               protocol                                   = "Tcp"
               source_address_prefix                      = "*"
               source_address_prefixes                    = []
               source_application_security_group_ids      = []
               source_port_range                          = "*"
               source_port_ranges                         = []
            }
}


resource "azurerm_virtual_network" "vnet1" {
  name                = "cemal-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}