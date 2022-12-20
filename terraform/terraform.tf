terraform {
  cloud {}
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }
  }
  required_version = "~> 1.3"
}

provider "random" {}