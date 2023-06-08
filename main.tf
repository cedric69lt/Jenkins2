terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">3.0"
    }
  }
}

provider "azurerm" {
   subscription_id = "393e3de3-0900-4b72-8f1b-fb3b1d6b97f1"
   client_id = "1244ff47-5233-442c-b8df-b761e220bc23"
   client_secret = "YtY8Q~Q6kLoKDGGGEn3lGlILr--HZ5EsbJwOGba-"
   tenant_id = "7349d3b2-951f-41be-877e-d8ccd9f3e73c"
   skip_provider_registration = true
   features {}
}

resource "azurerm_resource_group" "test" {
  name     = "cedrictestTerraform"
  location = "West Europe"
}
