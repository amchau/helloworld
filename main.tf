terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

variable "subject" {
  type        = string
  default     = "nice"
  description = "Subject to hello"
}

variable "name" {
  type = string

}

variable "location" {
  type = string
}

output "hello_world" {
  value = "Hello, ${var.subject}!"
}

provider "azurerm" {
  features {}
  use_msi = true
}

resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
}
