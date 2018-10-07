provider "azurerm" {
  version = "~> 1.3"
}

provider "null" {
  version = "~> 1.0"
}

variable "location" {
  description = "(Optional) Location of all resources. Default is `Australia Southeast`"
  default     = "Australia Southeast"
}
