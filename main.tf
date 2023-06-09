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
   client_id = "384ba4e4-fc1a-47f4-bf42-acec6fad1e82"
   client_secret = "lxk8Q~LfBuObGY4frVfc6B_e4Nqf6UMahS-BdaD-"
   tenant_id = "7349d3b2-951f-41be-877e-d8ccd9f3e73c"
   skip_provider_registration = true
   features {}
}

resource "azurerm_resource_group" "test" {
  name     = "cedrictestTerraform"
  location = "francecentral"
}

resource "azurerm_linux_virtual_machine" "nginx" {
   size = "Standard_F2"
   name = "CedricVmTerratest"
   resource_group_name = azurerm_resource_group.test.name
   location = azurerm_resource_group.test.location
   network_interface_ids = [
       azurerm_network_interface.webserver.id,
   ]

   source_image_reference {
       publisher = "Canonical"
       offer = "UbuntuServer"
       sku = "18.04-LTS"
       version = "latest"
   }

   computer_name = "nginx"
   admin_username = "adminuser"
   admin_password = "Faizan@bashir.123"
   disable_password_authentication = false

   os_disk {
       name = "nginxdisk01"
       caching = "ReadWrite"
       #create_option = "FromImage"
       storage_account_type = "Standard_LRS"
   }

   tags = {
       environment = var.environment
       costcenter = "it"
   }

