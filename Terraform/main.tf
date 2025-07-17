provider "azurerm" {
  features {}
  use_msi        = true
  subscription_id = "0fe51441-3dea-4d6d-a973-0a269518e2a2"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-lab-edilson"
  location = "East US"
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
