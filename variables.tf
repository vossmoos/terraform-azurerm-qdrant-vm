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

variable "public_key" {
  type = string
  sensitive = true
  description = "SSH public key for the virtual machine"
}

variable "vm_size" {
  type = string
  description = "Machine size"
  default = "Standard_B2s"
}

variable "subscription_id" {
  type = string
  description = "Azure subscription ID"
}