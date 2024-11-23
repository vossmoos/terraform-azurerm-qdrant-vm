variable "region" {
  description = "The region to deploy the resources"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "network_interface_ids" {
  description = "List of network interface IDs to attach to the virtual machine"
  type        = list(string)
}

variable "admin_username" {
  type = string
  description = "Username for the virtual machine"
}

variable "admin_password" {
  type = string
  sensitive = true
  description = "Password for the virtual machine (stored securely)"
}

variable "vm_size" {
  type = string
  description = "Machine size"
  default = "Standard_B1ms"
}

variable "subscription_id" {
  type = string
  description = "Azure subscription ID"
}