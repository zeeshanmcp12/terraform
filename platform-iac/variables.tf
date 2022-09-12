variable "resource_group_name" {
  default     = "learntfrg"
  type        = string
  description = "Resource Group to host platform resources"
}

variable "location" {
  default     = "westeurope"
  type        = string
  description = "(optional) describe your variable"
}

variable "tag" {
  default     = "dev"
  type        = string
  description = "(optional) describe your variable"
}

variable "storage_account_name" {
  default     = "learntfsto"
  type        = string
  description = "Storage account for function processing"
}

variable "app_service_plan_name" {
  default     = "learntfasp"
  type        = string
  description = "App service plan"
}

variable "func_app_name" {
  default     = "learntf-func-app"
  type        = string
  description = "Function app"
}