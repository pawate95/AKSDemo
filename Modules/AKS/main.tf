resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aksname
  location            = var.location
  resource_group_name = var.rgname
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Dev"
  }
}


data "azurerm_kubernetes_cluster" "aks"{
  resource_group_name = var.rgname
  name = azurerm_kubernetes_cluster.aks.id
}