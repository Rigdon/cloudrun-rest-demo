variable "apis" {
  description = "List of apis to enable"
  type        = list(string)
  default = [
    "sqladmin.googleapis.com",
    "artifactregistry.googleapis.com",
    "run.googleapis.com",
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com" //needed by terraform
  ]
}

resource "google_project_service" "apis" {
  for_each = toset(var.apis)
  service  = each.value

  disable_dependent_services = true
}
