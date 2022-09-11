variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "tag" {
  type        = string
  description = "Tag for resources"
}

variable "location" {
  type        = string
  description = "Default location of the resource"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name"
}

variable "storage_container_name" {
  type        = string
  description = "Container in storage account"
}

variable "app_service_plan" {
  type        = string
  description = "app service plan name"
}

variable "func_app_name" {
  type        = string
  description = "function app name"
}