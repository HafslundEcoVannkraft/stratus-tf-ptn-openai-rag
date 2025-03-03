# module "cognitive_account" {
#   source                = "Azure/avm-res-cognitiveservices-account/azurerm"
#   name                  = var.cognitive_account_name
#   resource_group_name   = var.resource_group_name
#   location              = var.location
#   sku_name              = "S0"
#   kind                  = "OpenAI"
#   custom_subdomain_name = var.custom_domain_name
#   local_auth_enabled    = false
#   managed_identities = {
#     system_assigned = true
#   }
#   network_acls = {
#     default_action = "Deny"
#     ip_rules       = var.client_ip_addresses
#   }
#   cognitive_deployments = {
#     "default" = {
#       name = var.cognitive_deployment_name
#       model = {
#         format  = "OpenAI"
#         name    = var.model_name
#         version = var.model_version
#       }
#       scale = {
#         type     = var.cognitive_deployment_sku
#         capacity = 450
#       }
#     }
#   }

#   #public_network_access_enabled = var.pe_subnets == [] ? true : false
#   public_network_access_enabled = true

#   private_endpoints = {
#     for idx, subnet in var.pe_subnets :
#     "endpoint_${idx}" => {
#       subnet_resource_id = subnet
#     }
#   }
#   private_endpoints_manage_dns_zone_group = false
# }

# module "search_service" {
#   source                  = "github.com/HafslundEcoVannkraft/stratus-tf-res-search-searchservice?ref=v1.1.1"
#   rg_id                   = azapi_resource.rg.id
#   search_service_name     = var.search_service_name
#   ip_rules                = []
#   pe_subnets              = var.pe_subnets
#   location                = var.location
#   network_rule_set_bypass = "AzureServices"
#   public_network_access   = "Disabled"
# }

# module "ai_hub_storage_account" {
#   source = "github.com/HafslundEcoVannkraft/stratus-tf-res-storage-storageaccount?ref=v1.0.0"

#   rg_name              = var.resource_group_name
#   location             = var.location
#   storage_account_name = var.storage_account_name
#   network_acls_bypass  = "AzureServices"
#   depends_on = [azapi_resource.rg]
# }

# data "azapi_resource" "blob_service" {
#   type      = "Microsoft.Storage/storageAccounts/blobServices@2023-05-01"
#   name      = "default"
#   parent_id = module.ai_hub_storage_account.storage_account_resource_id
# }


# resource "azapi_resource" "blob_container" {
#   type      = "Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01"
#   name      = "cognitive-deployment-training-data"
#   parent_id = data.azapi_resource.blob_service.id
#   body = {
#     properties = {}
#   }
# }

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