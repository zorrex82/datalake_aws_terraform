variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
}

variable "company" {
  type        = string
  description = "Company name where the code will be provided"
  default     = "Company"
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "datalake"
}

variable "environment" {
  type        = string
  description = "Environment where the code will be provided. Valid values are: `dev`, `uat` , `prd` "

  validation {
    condition     = contains(["dev", "uat", "prd"], var.environment)
    error_message = "Invalid values. Accepted values are: dev, uat, prd ."
  }

  default = "dev"
}
