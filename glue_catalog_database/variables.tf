variable "catalog_name" {
  type        = string
  description = "(Required) Name of the database. The acceptable characters are lowercase letters, numbers, and the underscore character"
  default = null

}

variable "catalog_database_description" {
  type    = string
  default = "(Optional) Description of the database."
}

variable "catalog_id" {
  type        = string
  description = "(Optional) ID of the Glue Catalog to create the database in. If omitted, this defaults to the AWS Account ID."
  default     = null
}

variable "create_table_default_permission" {
  type        = any
  description = "(Optional) Creates a set of default permissions on the table for principals."
  default     = null
}