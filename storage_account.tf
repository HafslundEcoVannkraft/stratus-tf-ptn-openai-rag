module "ai_hub_storage_account" {
  #source = "github.com/HafslundEcoVannkraft/stratus-tf-res-storage-storageaccount?ref=v1.0.0"
  source = "github.com/HafslundEcoVannkraft/stratus-tf-res-storage-storageaccount?ref=feat/ml/add-ip-allowlist"

  rg_name              = var.resource_group_name
  location             = var.location
  storage_account_name = var.storage_account_name
  pe_subnets           = []
  network_acls_bypass  = "AzureServices"
  ip_address_allowlist = var.client_ip_addresses
}

data "azapi_resource" "blob_service" {
  type      = "Microsoft.Storage/storageAccounts/blobServices@2023-05-01"
  name      = "default"
  parent_id = module.ai_hub_storage_account.storage_account_resource_id
}


resource "azapi_resource" "blob_container" {
  type      = "Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01"
  name      = "cognitive-deployment-training-data"
  parent_id = data.azapi_resource.blob_service.id
  body = {
    properties = {}
  }
}