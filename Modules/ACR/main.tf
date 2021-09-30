resource "azurerm_container_registry" "acr" {
  name                = var.acrname
  resource_group_name = var.rgname
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}

data "azurerm_container_registry" "acr" {
  name                = azurerm_container_registry.acr.id
  resource_group_name = var.rgname

}