
resource "azurerm_container_registry" "acr" {
  name                = "Pradyumnavikramsingh1"
  resource_group_name = var.rg_name
  location            = var.registry_location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}