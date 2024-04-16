terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

resource "azurerm_resource_group" "bestrong-rg" {
  location = var.location
  name     = var.rg_name
}

resource "azurerm_kubernetes_cluster" "bestrongcluster" {
  depends_on = [azurerm_resource_group.bestrong-rg]
  location            = var.location
  name                = var.cluster_name
  resource_group_name = var.rg_name
  dns_prefix          = "bestrongaks"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "default"
    vm_size    = "Standard_A2_v2"
    node_count = var.node_count
  }
}
#
#resource "azurerm_role_assignment" "kubweb_to_acr" {
#  scope                = azurerm_container_registry.acr.id
#  role_definition_name = "AcrPull"
#  principal_id         = azurerm_kubernetes_cluster.kubweb.kubelet_identity[0].object_id
#}
