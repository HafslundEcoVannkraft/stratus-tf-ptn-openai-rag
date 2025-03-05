variable "cognitive_account_name" {
  description = "Name of the Cognitive Services account"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resource group"
  type        = string
}

variable "custom_domain_name" {
  description = "Custom domain name for the Cognitive Services account"
  type        = string
}

variable "client_ip_addresses" {
  description = "List of IP addresses that are allowed to access the Cognitive Services account"
  type        = list(string)
}

variable "cognitive_deployment_name" {
  description = "Name of the Cognitive deployment"
  type        = string
}

variable "model_name" {
  description = "Name of the model"
  type        = string
}

variable "model_version" {
  description = "Version of the model"
  type        = string
}

variable "cognitive_deployment_sku" {
  description = "SKU of the Cognitive deployment"
  type        = string
}

variable "search_service_name" {
  description = "Name of the search service"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}