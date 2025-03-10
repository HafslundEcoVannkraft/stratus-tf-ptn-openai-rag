module "search_service" {
  #source                  = "github.com/HafslundEcoVannkraft/stratus-tf-res-search-searchservice?ref=v1.1.1"
  source                       = "github.com/HafslundEcoVannkraft/stratus-tf-res-search-searchservice?ref=main"
  rg_id                        = data.azapi_resource.resource_group.id
  search_service_name          = var.search_service_name
  ip_rules                     = []
  location                     = var.location
  network_rule_set_bypass      = "AzureServices"
  public_network_access        = "Disabled"
  lifecycle_ignore_tag_changes = true
}
