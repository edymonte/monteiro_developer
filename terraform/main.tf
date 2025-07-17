provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "monteiro-rg"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "monteiro-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "monteiroaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}
