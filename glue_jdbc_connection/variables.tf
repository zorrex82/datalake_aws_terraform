variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"

}

variable "company" {
  type        = string
  default     = "company"
  description = "(Required) Company name"
}

variable "project" {
  type        = string
  description = "(Required) Project name"
  default     = "datalake"
}

variable "environment" {
  type        = string
  description = "(Required) Environment where the resource should be created."
  validation {
    condition     = contains(["dev", "uat", "prd"], var.environment)
    error_message = "Environment where the resource should be created. Accepted values are: dev, uat, prd"
  }
}

variable "name" {
  type        = string
  description = "(Required) application name"
}


variable "crawler_description" {
  type    = string
  default = "(Optional) Description of the crawler."
}

variable "database_name" {
  type        = string
  description = "(Required) Glue database where results are written."
}

variable "glue_role" {
  type        = string
  description = "(Required) The IAM role friendly name (including path without leading slash), or ARN of an IAM role, used by the crawler to access other resources."
}

variable "iam_policy_glue" {
  default = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  ]
}

variable "availability_zone" {
  type        = string
  description = "(Optional) The availability zone of the connection. This field is redundant and implied by subnet_id, but is currently an api requirement."
  default     = null
}

variable "security_group_id_list" {
  type        = string
  description = "(Optional) The security group ID list used by the connection."
  default     = null

}

variable "subnet_id" {
  type        = string
  description = "(Optional) The subnet ID used by the connection."
  default     = null

}

variable "connection_properties" {
  type        = map(string)
  description = "(Optional) A map of key-value pairs used as parameters for this connection."
  default = {
    "string_connection" = "string"
    "jdbc_user"         = "user"
    "jdbc_pass"         = "password"
  }

}