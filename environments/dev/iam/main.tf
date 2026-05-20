module "api_service_account" {
  source       = "../../../modules/service_account"
  account_id   = "api-service-account"
  display_name = "API Service Account"
}

# Secret Manager access
module "secret_manager_access" {
  source     = "../../../modules/iam"
  project_id = var.project_id
  role       = "roles/secretmanager.secretAccessor"
  member     = "serviceAccount:${module.api_service_account.email}"
}

# Artifact Registry - push images (Bitbucket)
module "artifact_registry_write" {
  source     = "../../../modules/iam"
  project_id = var.project_id
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${module.api_service_account.email}"
}

# Artifact Registry - pull images (VM)
module "artifact_registry_read" {
  source     = "../../../modules/iam"
  project_id = var.project_id
  role       = "roles/artifactregistry.reader"
  member     = "serviceAccount:${module.api_service_account.email}"
}
