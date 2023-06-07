variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"

}

variable "company" {
  type        = string
  default     = "company"
  description = "Company name"
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "datalake"
}

variable "environment" {
  type        = string
  description = "Environment where the resource should be created."
  validation {
    condition     = contains(["dev", "uat", "prd"], var.environment)
    error_message = "Environment where the resource should be created. Accepted values are: dev, uat, prd"
  }
}

variable "name" {
  type        = string
  description = "application name"
}


variable "crawler_description" {
  type    = string
  default = "Glue crawler to generate tables in the data catalog."
}

variable "database_name" {
  type        = string
  description = "Glue catalog database."
}

variable "glue_role" {
  type        = string
  description = "IAM role used in Glue's crawlers."
}

variable "iam_policy_glue" {
  default = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  ]
}
