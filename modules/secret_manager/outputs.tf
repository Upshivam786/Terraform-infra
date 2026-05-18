output "secret_names" {
  value = keys(google_secret_manager_secret.secrets)
}
