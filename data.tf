data "azurerm_client_config" "current" {}

data "azapi_resource" "resource_group" {
  type = "Microsoft.Resources/resourceGroups@2021-04-01"
  name = var.resource_group_name
}