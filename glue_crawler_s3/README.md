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
| [aws_glue_crawler.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_crawler) | resource |
| [aws_iam_role.glue_crawler_service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.glue_role_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.glue_crawler_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_company"></a> [company](#input\_company) | (Required) Company name | `string` | `"company"` | no |
| <a name="input_crawler_description"></a> [crawler\_description](#input\_crawler\_description) | n/a | `string` | `"(Optional) Description of the crawler."` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | (Required) Glue database where results are written. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) Environment where the resource should be created. | `string` | n/a | yes |
| <a name="input_glue_role"></a> [glue\_role](#input\_glue\_role) | (Required) The IAM role friendly name (including path without leading slash), or ARN of an IAM role, used by the crawler to access other resources. | `string` | n/a | yes |
| <a name="input_iam_policy_glue"></a> [iam\_policy\_glue](#input\_iam\_policy\_glue) | n/a | `list` | <pre>[<br>  "arn:aws:iam::aws:policy/AmazonS3FullAccess",<br>  "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole",<br>  "arn:aws:iam::aws:policy/AmazonEC2FullAccess"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) application name | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | (Required) Project name | `string` | `"datalake"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |
| <a name="input_s3_target"></a> [s3\_target](#input\_s3\_target) | (Optional) List nested Amazon S3 target arguments. See S3 Target below. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_glue_crawler_application"></a> [glue\_crawler\_application](#output\_glue\_crawler\_application) | Glue crawler |
