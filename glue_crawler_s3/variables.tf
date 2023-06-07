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

variable "s3_target" {
  type = string
  description = "(Optional) List nested Amazon S3 target arguments. See S3 Target below."
  
}