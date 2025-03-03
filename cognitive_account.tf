module "cognitive_account" {
  source                = "Azure/avm-res-cognitiveservices-account/azurerm"
  name                  = var.cognitive_account_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  sku_name              = "S0"
  kind                  = "OpenAI"
  custom_subdomain_name = var.custom_domain_name
  local_auth_enabled    = false
  managed_identities = {
    system_assigned = true
  }
  network_acls = {
    default_action = "Deny"
    ip_rules       = var.client_ip_addresses
  }
  cognitive_deployments = {
    "default" = {
      name = var.cognitive_deployment_name
      model = {
        format  = "OpenAI"
        name    = var.model_name
        version = var.model_version
      }
      scale = {
        type     = var.cognitive_deployment_sku
        capacity = 450
      }
    }
  }

  public_network_access_enabled = true
}