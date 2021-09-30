# Create a Resource Group
resource "azurerm_resource_group" "DemoRG" {
    name        = var.rgname
    location    = var.location
}

data "azurerm_resource_group" "DemoRG" {
    name = azurerm_resource_group.DemoRG.name
}