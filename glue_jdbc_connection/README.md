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
| [aws_glue_connection.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | (Optional) The availability zone of the connection. This field is redundant and implied by subnet\_id, but is currently an api requirement. | `string` | `null` | no |
| <a name="input_company"></a> [company](#input\_company) | (Required) Company name | `string` | `"company"` | no |
| <a name="input_connection_properties"></a> [connection\_properties](#input\_connection\_properties) | (Optional) A map of key-value pairs used as parameters for this connection. | `map(string)` | <pre>{<br>  "jdbc_pass": "password",<br>  "jdbc_user": "user",<br>  "string_connection": "string"<br>}</pre> | no |
| <a name="input_crawler_description"></a> [crawler\_description](#input\_crawler\_description) | n/a | `string` | `"(Optional) Description of the crawler."` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | (Required) Glue database where results are written. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Environment where the resource should be created. | `string` | n/a | yes |
| <a name="input_glue_role"></a> [glue\_role](#input\_glue\_role) | (Required) The IAM role friendly name (including path without leading slash), or ARN of an IAM role, used by the crawler to access other resources. | `string` | n/a | yes |
| <a name="input_iam_policy_glue"></a> [iam\_policy\_glue](#input\_iam\_policy\_glue) | n/a | `list` | <pre>[<br>  "arn:aws:iam::aws:policy/AmazonS3FullAccess",<br>  "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole",<br>  "arn:aws:iam::aws:policy/AmazonEC2FullAccess"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) application name | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | (Required) Project name | `string` | `"datalake"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |
| <a name="input_security_group_id_list"></a> [security\_group\_id\_list](#input\_security\_group\_id\_list) | (Optional) The security group ID list used by the connection. | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | (Optional) The subnet ID used by the connection. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_name"></a> [connection\_name](#output\_connection\_name) | n/a |
