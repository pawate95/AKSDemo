# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

module "rgname" {
  source   = "../Modules/Resource Group"
  rgname   = var.rgname
  location = var.location
}

module "aks" {
  source   = "../Modules/AKS"
  aksname  = var.aksname
  rgname   = module.rgname.resourcegroupname
  location = var.location
  acrid    = module.acr.acr_id
}

module "acr" {
  source   = "../Modules/ACR"
  acrname  = var.acrname
  rgname   = module.rgname.resourcegroupname
  location = var.location
}