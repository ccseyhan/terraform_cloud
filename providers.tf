terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.36.0"
    }
  }
    backend "remote" {

    organization = "ccseyhan"

    workspaces {

      name = "terraform_cloud"

    }

   

  }
}

provider "azurerm" {
  features {
    
  }
}