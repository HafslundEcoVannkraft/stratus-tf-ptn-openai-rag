# required roles are documented here https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/on-your-data-configuration#role-assignments

# give roles 
# Search Service Contributor, Search Index Data Reader
# to the Cognitive Services account on scope of the openai_search_service.storage_account_resource_id
resource "azurerm_role_assignment" "openai_search_service_contributor" {
  scope                = module.search_service.search_service_resource_id
  role_definition_name = "Search Service Contributor"
  principal_id         = module.cognitive_account.system_assigned_mi_principal_id
}

resource "azurerm_role_assignment" "openai_search_index_data_reader" {
  scope                = module.search_service.search_service_resource_id
  role_definition_name = "Search Index Data Reader"
  principal_id         = module.cognitive_account.system_assigned_mi_principal_id
}


# give role 
# Cognitive Services OpenAI Contributor
# to the search service MI on scope of the Cognitive Services account
resource "azurerm_role_assignment" "openai_search_service_mi_contributor" {
  scope                = module.cognitive_account.resource_id
  role_definition_name = "Cognitive Services OpenAI Contributor"
  principal_id         = module.search_service.identity[0].principal_id
}


# give role
# Storage Blob Data Contributor
# to the search service MI on scope of the storage account.
resource "azurerm_role_assignment" "search_service_storage_blob_data_contributor" {
  scope                = module.storage_account.resource_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.search_service.identity[0].principal_id
}

# give role
# Storage Blob Data Contributor
# to the cognitive services account MI on scope of the storage account.
resource "azurerm_role_assignment" "cognitive_service_storage_blob_data_contributor" {
  scope                = module.storage_account.resource_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.cognitive_account.system_assigned_mi_principal_id
}
