variable "project_id" {}
variable "region" {}
variable "machine_type" {}
variable "image" {}
variable "network" {}
variable "subnetwork" {}
variable "service_account_email" {}
variable "startup_script" {
  default = ""
}
variable "tags" {
  type = list(string)
}
