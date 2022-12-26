variable "gcp_github_sa_name" {
  type      = string
  sensitive = true
}

resource "google_artifact_registry_repository" "app_repo" {
  location      = var.gcp_default_region
  project       = var.gcp_project
  repository_id = local.app_name
  description   = "Docker repository for hosting the app image"
  format        = "DOCKER"
}


resource "google_artifact_registry_repository_iam_member" "publisher" {
  project    = google_artifact_registry_repository.app_repo.project
  location   = google_artifact_registry_repository.app_repo.location
  repository = google_artifact_registry_repository.app_repo.name
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${var.gcp_github_sa_name}"
}
