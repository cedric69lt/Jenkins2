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
   client_id = "2974287e-6743-44e9-a74c-76fe4f8cbf11"
   client_secret = "oXg8Q~B5bgI3sB4wwMzS0o~L1aohd4FlKSaU4aqR"
   tenant_id = "7349d3b2-951f-41be-877e-d8ccd9f3e73c"
   skip_provider_registration = true
   features {}
}

resource "azurerm_resource_group" "test" {
  name     = "cedrictestTerraform"
  location = "francecentral"
}
