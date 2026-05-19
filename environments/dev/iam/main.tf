module "api_service_account" {
  source = "../../../modules/service_account"

  account_id   = "api-service-account"
  display_name = "API Service Account"
}

module "secret_manager_access" {
  source = "../../../modules/iam"

  project_id = var.project_id
  role       = "roles/secretmanager.secretAccessor"

  member = "serviceAccount:${module.api_service_account.email}"
}
