variable "subscription_id" {
  type        = string
  description = "ID of the subscription provided by secret.tfvars"
}

variable "tenant_id" {
  type        = string
  description = "ID of the tenant provided by secret.tfvars"
}

variable "client_id" {
  type        = string
  description = "Service Principal ID provided by secret.tfvars"
}

variable "client_secret" {
  type        = string
  description = "Service Principal secret provided by secret.tfvars"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group"
}

variable "rg_name" {
  type        = string
  default     = "bestrong-rg"
  description = "Name of the resource group"
}

variable "node_count" {
  type        = number
  default     = 2
  description = "The initial quantity of nodes for the node pool"
}

variable "cluster_name" {
  type        = string
  default     = "bestrong_cluster"
  description = "Name of the AKS cluster"
}

