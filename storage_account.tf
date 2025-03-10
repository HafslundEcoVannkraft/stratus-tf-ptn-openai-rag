module "storage_account" {
  source              = "Azure/avm-res-storage-storageaccount/azurerm"
  version             = "0.5.0"
  location            = var.location
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name

  allowed_copy_scope                = "AAD"
  default_to_oauth_authentication   = true
  public_network_access_enabled     = true
  infrastructure_encryption_enabled = true

  blob_properties = {
    change_feed_enabled           = true
    change_feed_retention_in_days = 30
    versioning_enabled            = true
    restore_policy = {
      days = 14
    }
    delete_retention_policy = {
      days = 15
    }
    container_delete_retention_policy = {
      days = 30
    }
  }

  network_rules = {
    default_action = "Deny"
    ip_rules       = var.client_ip_addresses
    bypass         = ["AzureServices"]
  }
}