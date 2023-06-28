terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.59.0"
    }
  }
}

variable "subject" {
  type        = string
  default     = "nice"
  description = "Subject to hello"
}

variable "name" {
  type    = string
  default = "sample-rg"

}

variable "location" {
  type    = string
  default = "westeurope"
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
