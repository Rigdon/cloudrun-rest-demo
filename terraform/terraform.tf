terraform {
  cloud {}
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"

    google = {
      source  = "hashicorp/google"
      version = "~> 4.46"
    }

    }
  }
  required_version = "~> 1.3"
}

provider "random" {}

variable "gcp_project" {
  type        = string
  description = "Project name in GCP"
}

variable "gcp_default_region" {
  type        = string
  description = "Default region for GCP resources"
}

variable "gcp_default_zone" {
  type        = string
  description = "Default zone for GCP resources"
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_default_region
  zone    = var.gcp_default_zone
}
