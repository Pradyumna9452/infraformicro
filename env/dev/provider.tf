terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }
  
   backend "azurerm" {
    resource_group_name  = "rg_mith"
    storage_account_name = "bahutkhrabnamehai"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
   }

}
provider "azurerm" {
    features {}
    subscription_id = "dfad8f6a-4ed1-4448-b795-d396ad2c60db"
  # Configuration options
}