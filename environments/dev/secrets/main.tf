module "secrets" {
  source = "../../../modules/secret_manager"

  secret_names = var.secret_names
}