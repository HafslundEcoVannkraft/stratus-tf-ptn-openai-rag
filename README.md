## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 2.2.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.21.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cognitive_account"></a> [cognitive\_account](#module\_cognitive\_account) | Azure/avm-res-cognitiveservices-account/azurerm | n/a |
| <a name="module_search_service"></a> [search\_service](#module\_search\_service) | github.com/HafslundEcoVannkraft/stratus-tf-res-search-searchservice | v1.1.1 |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | Azure/avm-res-storage-storageaccount/azurerm | 0.5.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.cognitive_service_storage_blob_data_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.openai_search_index_data_reader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.openai_search_service_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.openai_search_service_mi_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.search_service_conributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.search_service_storage_blob_data_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azapi_resource.resource_group](https://registry.terraform.io/providers/Azure/azapi/latest/docs/data-sources/resource) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_ip_addresses"></a> [client\_ip\_addresses](#input\_client\_ip\_addresses) | List of IP addresses that are allowed to access the Cognitive Services account | `list(string)` | n/a | yes |
| <a name="input_cognitive_account_name"></a> [cognitive\_account\_name](#input\_cognitive\_account\_name) | Name of the Cognitive Services account | `string` | n/a | yes |
| <a name="input_cognitive_deployment_name"></a> [cognitive\_deployment\_name](#input\_cognitive\_deployment\_name) | Name of the Cognitive deployment | `string` | n/a | yes |
| <a name="input_cognitive_deployment_sku"></a> [cognitive\_deployment\_sku](#input\_cognitive\_deployment\_sku) | SKU of the Cognitive deployment | `string` | n/a | yes |
| <a name="input_custom_domain_name"></a> [custom\_domain\_name](#input\_custom\_domain\_name) | Custom domain name for the Cognitive Services account | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource group | `string` | n/a | yes |
| <a name="input_model_name"></a> [model\_name](#input\_model\_name) | Name of the model | `string` | n/a | yes |
| <a name="input_model_version"></a> [model\_version](#input\_model\_version) | Version of the model | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_search_service_name"></a> [search\_service\_name](#input\_search\_service\_name) | Name of the search service | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Name of the storage account | `string` | n/a | yes |

## Outputs

No outputs.

## Security Considerations and Manual Steps

This pattern module deploys an Azure (1) OpenAI model, (2) Search Service and (3) Storage Account, as well as a number of managed identity RBAC assignments which are required in order to complete the "Add your own data" (RAG) wizard in the Azure OpenAI Foundry portal. Both the OpenAI model and Search Service are hardcoded in this moule to *not* accept traffic from the public Internet. However, as of March 2025, if you want to complete the "Add your own data" wizard in the Azure OpenAI Foundry for the OpenAI model, you need to temporarily allow traffic from the public Internet to both the OpenAI model as well as the Search Service. If you don't add this temporary opening, the wizard will fail, either during validation or at some point during data ingestion. After you have completed the wizard, you can reconfigure the OpenAI model and Search Service to not accept traffic from the public Internet by re-applying this Terraform module.
