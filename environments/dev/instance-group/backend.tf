terraform {
  backend "gcs" {
    bucket = "shivam-terraform-state"
    prefix = "dev/instance-group"
  }
}
