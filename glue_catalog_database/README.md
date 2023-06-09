## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | ../name_convention | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_glue_catalog_database.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_catalog_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_catalog_database_description"></a> [catalog\_database\_description](#input\_catalog\_database\_description) | n/a | `string` | `"(Optional) Description of the database."` | no |
| <a name="input_catalog_id"></a> [catalog\_id](#input\_catalog\_id) | (Optional) ID of the Glue Catalog to create the database in. If omitted, this defaults to the AWS Account ID. | `string` | `null` | no |
| <a name="input_catalog_name"></a> [catalog\_name](#input\_catalog\_name) | (Required) Name of the database. The acceptable characters are lowercase letters, numbers, and the underscore character | `string` | `null` | no |
| <a name="input_create_table_default_permission"></a> [create\_table\_default\_permission](#input\_create\_table\_default\_permission) | (Optional) Creates a set of default permissions on the table for principals. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Glue catalog database ARN |
| <a name="output_id"></a> [id](#output\_id) | Glue catalog database ID |
| <a name="output_name"></a> [name](#output\_name) | Glue catalog database name |
