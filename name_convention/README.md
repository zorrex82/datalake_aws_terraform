## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_custom"></a> [custom](#module\_custom) | cloudposse/label/null | 0.25.0 |
| <a name="module_root"></a> [root](#module\_root) | cloudposse/label/null | 0.25.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_company"></a> [company](#input\_company) | Company name where the code will be provided | `string` | `"Company"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment where the code will be provided. Valid values are: `dev`, `uat` , `prd` | `string` | `"dev"` | no |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"datalake"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_context"></a> [custom\_context](#output\_custom\_context) | Custom context for naming based on inputs passed. Context with variables from the `cloudposse/label/null` module. Does not consider services. |
| <a name="output_custom_context_id"></a> [custom\_context\_id](#output\_custom\_context\_id) | Custom context ID string for naming based on inputs passed. Does not consider services. |
| <a name="output_datalake_context"></a> [datalake\_context](#output\_datalake\_context) | Custom context for naming based on inputs passed. Context with standard Datalake variables: `region` `component_name` `environment`. Does not consider services. |
